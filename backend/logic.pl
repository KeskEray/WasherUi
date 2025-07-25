:- dynamic ask/2.

diagnose(guc_yok) :-
    ask('Makine hic acilmiyor mu?', yes),
    ask('Ekranda herhangi bir isik yaniyor mu?', no),
    ask('Ayni prizde baska bir cihaz calisiyor mu?', yes),
    ask('Farkli bir prize taktiniz mi?', yes),
    ask('Fis takili mi?', yes).

diagnose(su_bosaltmiyor) :-
    ask('Makine yikama sonrasi suyu bosaltmiyor mu?', yes),
    ask('Yikama bitince icinde su kaliyor mu?', yes),
    ask('Tahliye hortumunu kontrol ettiniz mi?', yes),
    ask('Filtreyi uzun suredir temizlemediniz mi?', yes).

diagnose(sikma_kapak_sorunu) :-
    ask('Makine sikma yapmiyor mu?', yes),
    ask('Tambur hic donmuyor mu?', yes),
    ask('Makine calisiyor gibi ses cikariyor mu?', yes),
    ask('Kapak tam kapali mi?', no).

diagnose(sikma_yuk_sorunu) :-
    ask('Makine sarsiliyor ya da dengesiz mi duruyor?', yes),
    ask('Makine asiri yuklenmis olabilir mi?', yes),
    ask('yuk dogru yerlestirildi mi?', yes).

diagnose(su_gelmiyor) :-
    ask('Makineye su hic gelmiyor mu?', yes),
    ask('Musluk acik mi?', yes),
    ask('Su giris hortumu bukulmus mu?', yes),
    ask('Su filtresi temiz mi?', no).

diagnose(disari_su_siziyor) :-
    ask('Makineden disariya su siziyor mu?', yes),
    ask('Zeminde su birikiyor mu?', yes),
    ask('Su makinenin on kismina mi siziyor?', yes),
    ask('Fazla deterjan koydunuz mu?', yes).

diagnose(deterjan_sorunu) :-
    ask('Camasirlarinizda deterjan kalintisi kaliyor mu?', yes),
    ask('Yikama tamamlandiginda camasirlar yapiskan mi?', yes),
    ask('Cok fazla deterjan kullandiniz mi?', yes),

diagnose(su_isitmiyor) :-
    ask('Makine suyu isitmiyor mu?', yes),
    ask('Yikama sicakligi dusuk mu?', yes),
    ask('Camasirlar soguk cikiyor mu?', yes),
    ask('Makine programi normalden daha cabuk bitiyor mu?', yes).

diagnose(tambur_donmuyor) :-
    ask('Tambur hic donmuyor mu?', yes),
    ask('Makineden motor sesi gelmiyor mu?', yes),
    ask('Makine calisirken anormal sesler cikiyor mu?', yes),
    ask('Tambur elle zor donuyor mu?', yes).

diagnose(cok_titreme) :-
    ask('Makine calisirken cok titresim oluyor mu?', yes),
    ask('Makine yerinden hareket ediyor mu?', yes),
    ask('Camasirlar dengesiz mi yerlestirildi?', yes),
    ask('Zemin duz degil mi?', yes).

diagnose(program_baslamiyor) :-
    ask('Start tusuna bastiginizda hicbir sey olmuyor mu?', yes),
    ask('Kilit isigi yaniyor mu?', no),
    ask('Kapak tam kapali mi?', yes),
    ask('Ekranda hata kodu gorunuyor mu?', yes).

diagnose(su_tasmasi) :-
    ask('Makine su almaya devam ediyor mu?', yes),
    ask('Su seviyesi normalden fazla mi?', yes),
    ask('Program durmuyor mu?', yes),
    ask('Bosaltma hic olmadi mi?', yes).

diagnose(kotu_koku) :-
    ask('Makineden kotu koku geliyor mu?', yes),
    ask('Makine uzun zamandir temizlenmedi mi?', yes),
    ask('Makineyi bos calistirmadiniz mi?', yes),
    ask('Camasirlar yikandiktan sonra kotu kokuyor mu?', yes).

diagnose(kapak_kilidi_sorunu) :-
    ask('Makine start tusuna basinca calismiyor mu?', yes),
    ask('Kapak tam kapaniyor mu?', no),
    ask('Kilit sesi duyulmuyor mu?', yes),
    ask('Ekranda kilit sembolü gorunuyor mu?', no).

diagnose(kontrol_paneli_cevap_vermiyor) :-
    ask('Tuslara bastiginizda hicbir tepki olmuyor mu?', yes),
    ask('Panelde hicbir isik yanmiyor mu?', yes),
    ask('Farkli program secince hicbir degisiklik olmuyor mu?', yes),
    ask('Makine prizde ve fis takili mi?', yes).

diagnose(asiri_kopuklenme) :-
    ask('Makine icinde cok fazla kopuk olustu mu?', yes),
    ask('Deterjan miktarini fazla koydunuz mu?', yes),
    ask('Deterjan bolmesinden tasma oldu mu?', yes),
    ask('Camdan kopuk goruluyor mu?', yes).

diagnose(yikama_sonrasi_su_kaldi) :-
    ask('Yikama bittikten sonra tamburda su kaldi mi?', yes),
    ask('Makine suyu tamamen bosaltamadi mi?', yes),
    ask('Filtreyi temizlemediniz mi?', yes),
    ask('Tahliye hortumu kivrilmis mi?', yes).

diagnose(cok_uzun_sure) :-
    ask('Yikama programi cok uzun suruyor mu?', yes),
    ask('Makine ortalama 2 saatten uzun calisiyor mu?', yes),
    ask('Su seviyesi cok yavas mi doluyor?', yes),
    ask('Su soguk mu geliyor?', yes).

diagnose(durulamiyor) :-
    ask('Camasirlar sabunlu kaliyor mu?', yes),
    ask('Makine durulama islemini tamamlamiyor mu?', yes),
    ask('Durulama programi normalden cabuk mu bitiyor?', yes),
    ask('Program ortasinda duruyor mu?', yes).

diagnose(pompa_gurultulu) :-
    ask('Su bosalirken makine gurultu cikariyor mu?', yes),
    ask('Pompa sesi normalden farkli mi?', yes),
    ask('Makine tikirti gibi sesler cikariyor mu?', yes),
    ask('Filtrede yabanci cisim olabilir mi?', yes).

diagnose(yumusatici_kullanilmiyor) :-
    ask('Yumusatici cekmecede kaliyor mu?', yes),
    ask('Camasirlar yumusatici kokmuyor mu?', yes),
    ask('Cekmece kismi islanmiyor mu?', yes),
    ask('Bolme tikanmis gibi mi?', yes).

diagnose(arka_su_sizintisi) :-
    ask('Makinenin arka tarafindan su siziyor mu?', yes),
    ask('Su hortumu gevsek mi?', yes),
    ask('Makine calisirken arka zeminde su birikiyor mu?', yes),
    ask('Su baglanti noktalari kontrol edildi mi?', no).

diagnose(tambur_surtunmesi) :-
    ask('Tambur donerken surtunme sesi geliyor mu?', yes),
    ask('Camasirlar yirtiliyor mu?', yes),
    ask('Makine tamburunu elle cevirdiginizde surtunme hissediliyor mu?', yes),
    ask('Makinede fiziksel hasar var mi?', yes).


solution(guc_yok, 'Fis, priz ve sigortayi kontrol edin. Elektrik geldiginden emin olun.').
solution(su_bosaltmiyor, 'Filtreyi temizleyin ve tahliye hortumunu kontrol edin.').
solution(sikma_kapak_sorunu, 'Kapak tam kapanmamis olabilir. Kapagi kontrol edin.').
solution(sikma_yuk_sorunu, 'Dengesiz veya fazla yuk. Yukleri yeniden yerlestirin.').
solution(su_gelmiyor, 'Musluk acik mi ve hortum bukulmus mu kontrol edin. Su filtresini temizleyin.').
solution(disari_su_siziyor, 'Cok fazla deterjan tasmaya neden olabilir. Deterjan miktarini azaltin, hortumlari kontrol edin.').
solution(deterjan_sorunu, 'Deterjan miktarini azaltin ve deterjan bolmesini temizleyin.').
solution(su_isitmiyor, 'Isitici rezistansi veya sicaklik sensoru arizali olabilir.').
solution(tambur_donmuyor, 'Tambur kayisi kopmus olabilir. Teknik servise basvurun.').
solution(cok_titreme, 'Makineyi dengeleyin. Ayaklarini ayarlayin ve camasirlari dengeli yerlestirin.').
solution(program_baslamiyor, 'Elektronik kart arizali olabilir. Teknik servis gereklidir.').
solution(su_tasmasi, 'Su seviye sensoru veya vana arizali olabilir.').
solution(kotu_koku, 'Makineyi 90 derece sicaklikta bos calistirin. Filtre ve deterjan cekmecesini temizleyin.').
solution(kapak_kilidi_sorunu, 'Kapak tam kapanmamis olabilir. Kilit mekanizmasini kontrol edin.').
solution(kontrol_paneli_cevap_vermiyor, 'Elektrik baglantisini kontrol edin. Panel arizali olabilir.').
solution(asiri_kopuklenme, 'Deterjan miktarini azaltin. Uygun tipte deterjan kullanin.').
solution(garip_ses, 'Tambur icinde sert nesne olup olmadigini kontrol edin. Yabanci cisim varsa cikarin.').
solution(yikama_sonrasi_su_kaldi, 'Filtreyi temizleyin ve tahliye hortumunun kivrilmadigindan emin olun.').
solution(cok_uzun_sure, 'Musluk acik mi ve su hizi yeterli mi kontrol edin. Sicak su girmesi gerekiyorsa kontrol edin.').
solution(durulamiyor, 'Durulama programini tekrar baslatin. Su seviyesini ve filtreyi kontrol edin.').
solution(pompa_gurultulu, 'Pompa icinde yabanci cisim olabilir. Filtreyi kontrol edin ve temizleyin.').
solution(yumusatici_kullanilmiyor, 'Yumusatici bolmesini temizleyin ve tikaniklik olmadigindan emin olun.').
solution(arka_su_sizintisi, 'Su hortumunu ve baglantilarini sikilastirin. Hortumda catlak varsa degistirin.').
solution(tambur_surtunmesi, 'Tamburda fiziksel hasar olabilir. Teknik servis kontrolu gerekebilir. Camasir miktarini azaltin.').


service(adalar, 'Adalar Servisi - 0216 001 01 01').
service(arnavutkoy, 'Arnavutkoy Servisi - 0212 002 02 02').
service(atasehir, 'Atasehir Servisi - 0216 003 03 03').
service(avcilar, 'Avcilar Servisi - 0212 004 04 04').
service(bagcilar, 'Bagcilar Servisi - 0212 005 05 05').
service(bahcelievler, 'Bahcelievler Servisi - 0212 006 06 06').
service(bakirkoy, 'Bakirkoy Servisi - 0212 007 07 07').
service(basaksehir, 'Basaksehir Servisi - 0212 008 08 08').
service(bayrampasa, 'Bayrampasa Servisi - 0212 009 09 09').
service(besiktas, 'Besiktas Servisi - 0212 010 10 10').
service(beykoz, 'Beykoz Servisi - 0216 011 11 11').
service(beylikduzu, 'Beylikduzu Servisi - 0212 012 12 12').
service(beyoglu, 'Beyoglu Servisi - 0212 013 13 13').
service(buyukcekmece, 'Buyukcekmece Servisi - 0212 014 14 14').
service(catalca, 'Catalca Servisi - 0212 015 15 15').
service(cekmekoy, 'Cekmekoy Servisi - 0216 016 16 16').
service(esenler, 'Esenler Servisi - 0212 017 17 17').
service(esenyurt, 'Esenyurt Servisi - 0212 018 18 18').
service(eyupsultan, 'Eyupsultan Servisi - 0212 019 19 19').
service(fatih, 'Fatih Servisi - 0212 020 20 20').
service(gaziosmanpasa, 'Gaziosmanpasa Servisi - 0212 021 21 21').
service(gungoren, 'Gungoren Servisi - 0212 022 22 22').
service(kadikoy, 'Kadikoy Servisi - 0216 023 23 23').
service(kagithane, 'Kagithane Servisi - 0212 024 24 24').
service(kartal, 'Kartal Servisi - 0216 025 25 25').
service(kucukcekmece, 'Kucukcekmece Servisi - 0212 026 26 26').
service(maltepe, 'Maltepe Servisi - 0216 027 27 27').
service(pendik, 'Pendik Servisi - 0216 028 28 28').
service(sancaktepe, 'Sancaktepe Servisi - 0216 029 29 29').
service(sariyer, 'Sariyer Servisi - 0212 030 30 30').
service(silivri, 'Silivri Servisi - 0212 031 31 31').
service(sultanbeyli, 'Sultanbeyli Servisi - 0216 032 32 32').
service(sultangazi, 'Sultangazi Servisi - 0212 033 33 33').
service(sile, 'Sile Servisi - 0216 034 34 34').
service(sisli, 'Sisli Servisi - 0212 035 35 35').
service(tuzla, 'Tuzla Servisi - 0216 036 36 36').
service(umraniye, 'Umraniye Servisi - 0216 037 37 37').
service(uskudar, 'Uskudar Servisi - 0216 038 38 38').
service(zeytinburnu, 'Zeytinburnu Servisi - 0212 039 39 39').

:- dynamic remembered/2.

ask(Question, Expected) :-
    remembered(Question, Answer), !,
    Answer = Expected.

ask(Question, Expected) :-
    write(Question), nl,
    write('>>> Lutfen sadece yes veya no olarak cevap verin:'), nl,
    read_line_to_string(user_input, Input),
    string_lower(Input, Lower),
    (
        (Lower = "yes"; Lower = "no") ->
            atom_string(AnswerAtom, Lower),
            assertz(remembered(Question, AnswerAtom)),
            AnswerAtom = Expected
        ;
            write('Lutfen sadece yes ya da no yaziniz.'), nl,
            ask(Question, Expected)
    ).

suggest_service :-
    nl,
    write('Istanbul''daki ilcenizi giriniz (ornek: kadikoy, besiktas):'), nl,
    read_line_to_string(user_input, Input),
    string_lower(Input, InputLower),
    atom_string(District, InputLower),
    (
        service(District, Phone) ->
            format('Size en yakin servis: ~w', [Phone]), nl
        ;
            write('Bu ilce icin servis bulunamadi.'), nl
    ).

start :-
    nl, write('Camasir Makinesi Uzman Sistemine Hosgeldiniz'), nl,
    write('Sorulara sadece yes veya no ile cevap verin.'), nl, nl,
    (
        diagnose(Fault) ->
            nl,
            solution(Fault, Explanation),
            format('Tespit edilen ariza: ~w', [Fault]), nl,
            write('>>> Cozum onerisi: '), nl,
            write(Explanation), nl,
            suggest_service
        ;
            write('Ariza tespit edilemedi. Lutfen teknik servisle iletisime gecin.'), nl
    ).
