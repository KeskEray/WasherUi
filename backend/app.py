from flask import Flask, request, jsonify
from flask_cors import CORS
from pyswip import Prolog
import html
app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}}) 

prolog = Prolog()
prolog.consult("logic.pl")

diagnosis_groups = [
    {
        "fault": "guc_yok",
        "questions": [
            {"text": "Makine hic acilmiyor mu?", "expected": "yes"},
            {"text": "Ekranda herhangi bir isik yaniyor mu?", "expected": "no"},
            {"text": "Ayni prizde baska bir cihaz calisiyor mu?", "expected": "yes"},
            {"text": "Farkli bir prize taktiniz mi?", "expected": "yes"},
            {"text": "Fis takili mi?", "expected": "yes"}
        ]
    },
    {
        "fault": "su_bosaltmiyor",
        "questions": [
            {"text": "Makine yikama sonrasi suyu bosaltmiyor mu?", "expected": "yes"},
            {"text": "Yikama bitince icinde su kaliyor mu?", "expected": "yes"},
            {"text": "Tahliye hortumunu kontrol ettiniz mi?", "expected": "yes"},
            {"text": "Filtreyi uzun suredir temizlemediniz mi?", "expected": "yes"}
        ]
    },
    {
        "fault": "sikma_kapak_sorunu",
        "questions": [
            {"text": "Makine sikma yapmiyor mu?", "expected": "yes"},
            {"text": "Tambur hic donmuyor mu?", "expected": "yes"},
            {"text": "Makine calisiyor gibi ses cikariyor mu?", "expected": "yes"},
            {"text": "Kapak tam kapali mi?", "expected": "no"}
        ]
    },
    {
        "fault": "sikma_yuk_sorunu",
        "questions": [
            {"text": "Makine sarsiliyor ya da dengesiz mi duruyor?", "expected": "yes"},
            {"text": "Makine asiri yuklenmis olabilir mi?", "expected": "yes"},
            {"text": "yuk dogru yerlestirildi mi?", "expected": "yes"}
        ]
    },
    {
        "fault": "su_gelmiyor",
        "questions": [
            {"text": "Makineye su hic gelmiyor mu?", "expected": "yes"},
            {"text": "Musluk acik mi?", "expected": "yes"},
            {"text": "Su giris hortumu bukulmus mu?", "expected": "yes"},
            {"text": "Su filtresi temiz mi?", "expected": "no"}
        ]
    },
    {
        "fault": "disari_su_siziyor",
        "questions": [
            {"text": "Makineden disariya su siziyor mu?", "expected": "yes"},
            {"text": "Zeminde su birikiyor mu?", "expected": "yes"},
            {"text": "Su makinenin on kismina mi siziyor?", "expected": "yes"},
            {"text": "Fazla deterjan koydunuz mu?", "expected": "yes"}
        ]
    },
    {
        "fault": "deterjan_sorunu",
        "questions": [
            {"text": "Camasirlarinizda deterjan kalintisi kaliyor mu?", "expected": "yes"},
            {"text": "Yikama tamamlandiginda camasirlar yapiskan mi?", "expected": "yes"},
            {"text": "Cok fazla deterjan kullandiniz mi?", "expected": "yes"}
        ]
    },
    {
        "fault": "su_isitmiyor",
        "questions": [
            {"text": "Makine suyu isitmiyor mu?", "expected": "yes"},
            {"text": "Yikama sicakligi dusuk mu?", "expected": "yes"},
            {"text": "Camasirlar soguk cikiyor mu?", "expected": "yes"},
            {"text": "Makine programi normalden daha cabuk bitiyor mu?", "expected": "yes"}
        ]
    },
    {
        "fault": "tambur_donmuyor",
        "questions": [
            {"text": "Tambur hic donmuyor mu?", "expected": "yes"},
            {"text": "Makineden motor sesi gelmiyor mu?", "expected": "yes"},
            {"text": "Makine calisirken anormal sesler cikiyor mu?", "expected": "yes"},
            {"text": "Tambur elle zor donuyor mu?", "expected": "yes"}
        ]
    },
    {
        "fault": "cok_titreme",
        "questions": [
            {"text": "Makine calisirken cok titresim oluyor mu?", "expected": "yes"},
            {"text": "Makine yerinden hareket ediyor mu?", "expected": "yes"},
            {"text": "Camasirlar dengesiz mi yerlestirildi?", "expected": "yes"},
            {"text": "Zemin duz degil mi?", "expected": "yes"}
        ]
    },
    {
        "fault": "program_baslamiyor",
        "questions": [
            {"text": "Start tusuna bastiginizda hicbir sey olmuyor mu?", "expected": "yes"},
            {"text": "Kilit isigi yaniyor mu?", "expected": "no"},
            {"text": "Kapak tam kapali mi?", "expected": "yes"},
            {"text": "Ekranda hata kodu gorunuyor mu?", "expected": "yes"}
        ]
    },
    {
        "fault": "su_tasmasi",
        "questions": [
            {"text": "Makine su almaya devam ediyor mu?", "expected": "yes"},
            {"text": "Su seviyesi normalden fazla mi?", "expected": "yes"},
            {"text": "Program durmuyor mu?", "expected": "yes"},
            {"text": "Bosaltma hic olmadi mi?", "expected": "yes"}
        ]
    },
    {
        "fault": "kotu_koku",
        "questions": [
            {"text": "Makine icinden kotu koku geliyor mu?", "expected": "yes"},
            {"text": "Makine uzun sure kullanilmadi mi?", "expected": "yes"},
            {"text": "Filtre hic temizlenmedi mi?", "expected": "yes"},
            {"text": "Deterjan bolmesinde kirli birikinti var mi?", "expected": "yes"}
        ]
    },
    {
        "fault": "kapak_kilidi_sorunu",
        "questions": [
            {"text": "Makine start tusuna basinca calismiyor mu?", "expected": "yes"},
            {"text": "Kapak tam kapaniyor mu?", "expected": "no"},
            {"text": "Kilit sesi duyulmuyor mu?", "expected": "yes"},
            {"text": "Ekranda kilit sembolü gorunuyor mu?", "expected": "no"}
        ]
    },
    {
        "fault": "kontrol_paneli_cevap_vermiyor",
        "questions": [
            {"text": "Tuslara bastiginizda hicbir tepki olmuyor mu?", "expected": "yes"},
            {"text": "Panelde hicbir isik yanmiyor mu?", "expected": "yes"},
            {"text": "Farkli program secince hicbir degisiklik olmuyor mu?", "expected": "yes"},
            {"text": "Makine prizde ve fis takili mi?", "expected": "yes"}
        ]
    },
    {
        "fault": "asiri_kopuklenme",
        "questions": [
            {"text": "Makine icinde cok fazla kopuk olustu mu?", "expected": "yes"},
            {"text": "Deterjan miktarini fazla koydunuz mu?", "expected": "yes"},
            {"text": "Deterjan bolmesinden tasma oldu mu?", "expected": "yes"},
            {"text": "Camdan kopuk goruluyor mu?", "expected": "yes"}
        ]
    },
    {
        "fault": "yikama_sonrasi_su_kaldi",
        "questions": [
            {"text": "Yikama bittikten sonra tamburda su kaldi mi?", "expected": "yes"},
            {"text": "Makine suyu tamamen bosaltamadi mi?", "expected": "yes"},
            {"text": "Filtreyi temizlemediniz mi?", "expected": "yes"},
            {"text": "Tahliye hortumu kivrilmis mi?", "expected": "yes"}
        ]
    },
    {
        "fault": "cok_uzun_sure",
        "questions": [
            {"text": "Yikama programi cok uzun suruyor mu?", "expected": "yes"},
            {"text": "Makine ortalama 2 saatten uzun calisiyor mu?", "expected": "yes"},
            {"text": "Su seviyesi cok yavas mi doluyor?", "expected": "yes"},
            {"text": "Su soguk mu geliyor?", "expected": "yes"}
        ]
    },
    {
        "fault": "durulamiyor",
        "questions": [
            {"text": "Camasirlar sabunlu kaliyor mu?", "expected": "yes"},
            {"text": "Makine durulama islemini tamamlamiyor mu?", "expected": "yes"},
            {"text": "Durulama programi normalden cabuk mu bitiyor?", "expected": "yes"},
            {"text": "Program ortasinda duruyor mu?", "expected": "yes"}
        ]
    },
    {
        "fault": "pompa_gurultulu",
        "questions": [
            {"text": "Su bosalirken makine gurultu cikariyor mu?", "expected": "yes"},
            {"text": "Pompa sesi normalden farkli mi?", "expected": "yes"},
            {"text": "Makine tikirti gibi sesler cikariyor mu?", "expected": "yes"},
            {"text": "Filtrede yabanci cisim olabilir mi?", "expected": "yes"}
        ]
    },
    {
        "fault": "yumusatici_kullanilmiyor",
        "questions": [
            {"text": "Yumusatici cekmecede kaliyor mu?", "expected": "yes"},
            {"text": "Camasirlar yumusatici kokmuyor mu?", "expected": "yes"},
            {"text": "Cekmece kismi islanmiyor mu?", "expected": "yes"},
            {"text": "Bolme tikanmis gibi mi?", "expected": "yes"}
        ]
    },
    {
        "fault": "arka_su_sizintisi",
        "questions": [
            {"text": "Makinenin arka tarafindan su siziyor mu?", "expected": "yes"},
            {"text": "Su hortumu gevsek mi?", "expected": "yes"},
            {"text": "Makine calisirken arka zeminde su birikiyor mu?", "expected": "yes"},
            {"text": "Su baglanti noktalari kontrol edildi mi?", "expected": "no"}
        ]
    },
    {
        "fault": "tambur_surtunmesi",
        "questions": [
            {"text": "Tambur donerken surtunme sesi geliyor mu?", "expected": "yes"},
            {"text": "Camasirlar yirtiliyor mu?", "expected": "yes"},
            {"text": "Makine tamburunu elle cevirdiginizde surtunme hissediliyor mu?", "expected": "yes"},
            {"text": "Makinede fiziksel hasar var mi?", "expected": "yes"}
        ]
    }
]

group_index = 0
question_index = 0
awaiting_district = False
current_diagnosis = None

@app.route("/start", methods=["GET"])
def start():
    global group_index, question_index, awaiting_district, current_diagnosis
    group_index = 0
    question_index = 0
    awaiting_district = False
    current_diagnosis = None
    prolog.retractall("ask(_,_)")
    return jsonify({
        "question": diagnosis_groups[group_index]["questions"][question_index],
        "done": False
    })

@app.route("/answer", methods=["POST"])
def answer():
    global group_index, question_index, awaiting_district, current_diagnosis
    data = request.get_json()
    ans = data.get("answer", "").lower()

    if ans not in ["yes", "no"]:
        return jsonify({"error": "Lütfen sadece yes veya no yazın."}), 400

    while group_index < len(diagnosis_groups):
        group = diagnosis_groups[group_index]
        if question_index >= len(group["questions"]):
          
            fault = group["fault"]
            current_diagnosis = fault
            result = list(prolog.query(f"solution({fault}, Explanation)."))
            sol = result[0]["Explanation"] if result else "Çözüm bulunamadı."
            awaiting_district = True
            return jsonify({
                "diagnosis": fault,
                "solution": sol,
                "ask_district": True,
                "done": False
            })

        current_question_obj = group["questions"][question_index]
        question_text = current_question_obj["text"]
        expected = current_question_obj["expected"]

       
        if ans != expected:
            group_index += 1
            question_index = 0
            if group_index < len(diagnosis_groups):
                return jsonify({"question": diagnosis_groups[group_index]["questions"][0]["text"], "done": False})
            else:
                current_diagnosis = None
                awaiting_district = True
                return jsonify({
                    "diagnosis": None,
                    "solution": "Herhangi bir arıza tespit edilemedi.",
                    "ask_district": True,
                    "done": False
                })


            

       
        safe_question = question_text.replace("'", "\\'")
        prolog.assertz(f"ask('{safe_question}', {ans})")
        question_index += 1

      
        if question_index < len(group["questions"]):
            return jsonify({
                "question": group["questions"][question_index]["text"],
                "done": False
            })

    return jsonify({"message": "Arıza tespit edilemedi.", "done": True})



@app.route("/service", methods=["POST"])
def get_service():
    global awaiting_district
    data = request.get_json()
    district = data.get("district", "").lower()

    if not awaiting_district:
        return jsonify({"error": "Ilce su anda sorulmuyor."}), 400

    result = list(prolog.query(f"service({district}, Phone)."))
    if result:
        return jsonify({
            "service": result[0]["Phone"],
            "done": True
        })
    else:
        return jsonify({
            "service": "Bu ilce icin servis bulunamadi.",
            "done": True
        })

if __name__ == "__main__":
    app.run(debug=True)
