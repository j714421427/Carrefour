    var occupations = ["S", "A", "T", "M", "P", "W", "K", "E"];
    var maxLevel = 5;

    var heros = [];
    var empty = "0";
    //T1
    var T1 = 0;
    var S = occupations[0];
    var A = occupations[1];
    var T = occupations[2];
    var M = occupations[3];
    var P = occupations[4];
    var W = occupations[5];
    var K = occupations[6];
    var E = occupations[7];
    heros.push(occupations);

    //T2
    var T2 = 1;
    var T2S1 = S + K;
    var T2S2 = S + S;

    var T2A1 = A + A;
    var T2A2 = A + T;

    var T2T1 = T + T;
    var T2T2 = S + T;

    var T2M1 = M + M;
    var T2M2 = M + W;

    var T2P1 = M + P;
    var T2P2 = A + P;

    var T2W1 = W + W;
    var T2W2 = W + E;

    var T2K1 = K + K;
    var T2K2 = A + K;

    var T2E1 = P + E;
    var T2E2 = K + E;

    heros.push(
    [
    T2S1, T2S2,
    T2A1, T2A2,
    T2T1, T2T2,
    T2M1, T2M2,
    T2P1, T2P2,
    T2W1, T2W2,
    T2K1, T2K2,
    T2E1, T2E2
    ]);

    //T3
    var T3 = 2;
    var T3S1 = T2S1 + T2S2;//SKSS
    var T3S2 = T2S1 + T2E2;//SKKE
    var T3S3 = T2S2 + T2W1;//SSWW
    var T3S4 = T2S2 + T2T2;//SSST

    var T3A1 = T2A1 + T2A2;//AAAT
    var T3A2 = T2A1 + T2K2;//AAAK
    var T3A3 = T2A2 + T2P2;//ATAP
    var T3A4 = T2A1 + T2E2;//AAKE

    var T3T1 = T2T1 + T2T2//TTST
    var T3T2 = T2T1 + T2E2//TTKE
    var T3T3 = T2S1 + T2T2//SKST
    var T3T4 = T2T2 + T2M1//STMM

    var T3M1 = T2M1 + T2E1//MMPE
    var T3M2 = T2T1 + T2M1//TTMM
    var T3M3 = T2M1 + T2M2//MMMW
    var T3M4 = T2A2 + T2M2//ATMW

    var T3P1 = T2T1 + T2P2;//TTAP
    var T3P2 = T2P1 + T2E1//MPPE
    var T3P3 = P + P + P + empty;//PPP0
    var T3P4 = T2A2 + T2P1;//ATMP

    var T3W1 = T2P1 + T2W1;//MPWW
    var T3W2 = T2W1 + T2W2;//WWWE
    var T3W3 = T2S2 + T2W2;//SSWE
    var T3W4 = T2M2 + T2W2;//MWWE

    var T3K1 = T2K1 + T2K2;//KKAK
    var T3K2 = T2S1 + T2K2;//SKAK
    var T3K3 = T2P1 + T2K1;//MPKK
    var T3K4 = T2W1 + T2K1;//WWKK

    var T3E1 = T2M2 + T2E1;//MWPE
    var T3E2 = E + E + E + empty;//EEE0
    var T3E3 = T2W2 + T2E2;//WEKE
    var T3E4 = T2P2 + T2E1;//APPE

    heros.push(
    [
    T3S1, T3S2, T3S3, T3S4,
    T3A1, T3A2, T3A3, T3A4,
    T3T1, T3T2, T3T3, T3T4,
    T3M1, T3M2, T3M3, T3M4,
    T3P1, T3P2, T3P3, T3P4,
    T3W1, T3W2, T3W3, T3W4,
    T3K1, T3K2, T3K3, T3K4,
    T3E1, T3E2, T3E3, T3E4
    ]);

    //T4
    var T4 = 3;
    var T4S1 = T3S1 + T3P1;//SKSSTTAP
    var T4S2 = T3S1 + T3W1;//SKSSMPWW
    var T4S3 = T3S2 + T3S3;//SKKESSWW
    var T4S4 = T3S1 + T3S2;//SKSSSKKE
    var T4S5 = T3S4 + T3E2;//SSSTEEE0
    var T4S6 = T3S4 + T3K4;//SSSTWWKK
    var T4S7 = "";//

    var T4A1 = T3A1 + T3A3;//AAATATAP
    var T4A2 = T3A3 + T3T1;//ATAPTTST
    var T4A3 = T3A1 + T3A2;//AAATAAAK
    var T4A4 = T3S3 + T3A2;//SSWWAAAK
    var T4A5 = T3A1 + T3A4;//AAATAAKE
    var T4A6 = T3A4 + T3T4;//AAKESTMM
    var T4A7 = "";//

    var T4T1 = T3T3 + T3P2;//SKSTMPPE
    var T4T2 = T3T1 + T3T3;//TTSTSKST
    var T4T3 = T3T2 + T3K4;//TTKEWWKK
    var T4T4 = T3T1 + T3T4;//TTSTSTMM
    var T4T5 = T3A2 + T3T2;//AAAKTTKE
    var T4T6 = T3T2 + T3E4;//TTKEAPPE
    var T4T7 = "";//

    var T4M1 = T3M1 + T3M2;//MMPETTMM
    var T4M2 = T3M2 + T3M4;//TTMMATMW
    var T4M3 = T3T3 + T3M3;//SKSTMMMW
    var T4M4 = T3A3 + T3M3;//ATAPMMMW
    var T4M5 = T3P2 + T3W4;//MMPEMWWE
    var T4M6 = T3M4 + T3E1;//ATMWMWPE
    var T4M7 = T3M2 + T3M3;//TTMMMMMW


    var T4P1 = T3S3 + T3P3;//SSWWPPP0
    var T4P2 = T3M1 + T3P1;//MMPETTAP
    var T4P3 = T3P3 + T3K2;//PPP0SKAK
    var T4P4 = T3P2 + T3P3;//MPPEPPP0
    var T4P5 = T3P4 + T3E4;//ATMPAPPE
    var T4P6 = T3P2 + T3P4;//MPPEATMP
    var T4P7 = "";//

    var T4W1 = T3W2 + T3E3;//WWWEWEKE
    var T4W2 = T3S4 + T3W4;//SSSTMWWE
    var T4W3 = T3W2 + T3W3;//WWWESSWE
    var T4W4 = T3P1 + T3W1;//TTAPMPWW
    var T4W5 = T3T4 + T3W3;//STMMSSWE
    var T4W6 = T3W3 + T3W4;//SSWEMWWE
    var T4W7 = "";//

    var T4K1 = T3K1 + T3K2;//KKAKSKAK
    var T4K2 = T3W2 + T3K4;//WWWEWWKK
    var T4K3 = T3M4 + T3K2;//ATMWSKAK
    var T4K4 = T3K1 + T3K3;//KKAKMPKK
    var T4K5 = T3P4 + T3K1;//ATMPKKAK
    var T4K6 = T3K3 + T3E3;//MPKKWEKE
    var T4K7 = "";//

    var T4E1 = T3A4 + T3E4;//AAKEAPPE
    var T4E2 = T3E1 + T3E3;//MWPEWEKE
    var T4E3 = T3S2 + T3E2;//SKKEEEE0
    var T4E4 = T3K3 + T3E2;//MPKKEEE0
    var T4E5 = T3E1 + T3E2;//MWPEEEE0
    var T4E6 = T3W1 + T3E1;//MPWWMWPE
    var T4E7 = "";//

    heros.push(
    [
    T4S1, T4S2, T4S3, T4S4, T4S5, T4S6, T4S7,
    T4A1, T4A2, T4A3, T4A4, T4A5, T4A6, T4A7,
    T4T1, T4T2, T4T3, T4T4, T4T5, T4T6, T4T7,
    T4M1, T4M2, T4M3, T4M4, T4M5, T4M6, T4M7,
    T4P1, T4P2, T4P3, T4P4, T4P5, T4P6, T4P7,
    T4W1, T4W2, T4W3, T4W4, T4W5, T4W6, T4W7,
    T4K1, T4K2, T4K3, T4K4, T4K5, T4K6, T4K7,
    T4E1, T4E2, T4E3, T4E4, T4E5, T4E6, T4E7,
    ]);

    //T5
    var T5 = 4;
    var T5S1 = T4S2 + T4M2;//SKSSMPWWTTMMATMW
    var T5S2 = T4S1 + T4S3;//SKSSTTAPSKKESSWW
    var T5S3 = T4S3 + T4S4;//SKKESSWWSKSSSKKE
    var T5S4 = T4S6 + T4A4;//SSSTWWKKSSWWAAAK
    var T5S5 = "";//
    var T5S6 = "";//

    var T5A1 = T4A1 + T4A2;//AAATATAPATAPTTST
    var T5A2 = T4A3 + T4T4;//AAATAAAKTTSTSTMM
    var T5A3 = T4A4 + T4T1;//SSWWAAAKSKSTMPPE
    var T5A4 = T4A2 + T4A5;//ATAPTTSTAAATAAKE
    var T5A5 = "";//
    var T5A6 = "";//

    var T5T1 = T4T3 + T4W6;//TTKEWWKKSSWEMWWE
    var T5T2 = T4S6 + T4T6;//SSSTWWKKTTKEAPPE
    var T5T3 = T4T1 + T4T2;//SKSTMPPETTSTSKST
    var T5T4 = T4T2 + T4T4;//TTSTSKSTTTSTSTMM
    var T5T5 = "";//
    var T5T6 = "";//

    var T5M1 = T4M1 + T4M2;//MMPETTMMTTMMATMW
    var T5M2 = T4M4 + T4P4;//ATAPMMMWMPPEPPP0
    var T5M3 = T4M6 + T4M7;//ATMWMWPETTMMMMMW
    var T5M4 = T4M3 + T4P6;//SKSTMMMWMPPEATMP
    var T5M5 = "";//
    var T5M6 = "";//

    var T5P1 = T4P1 + T4W4;//SSWWPPP0TTAPMPWW
    var T5P2 = T4M3 + T4P3;//SKSTMMMWPPP0SKAK
    var T5P3 = T4P2 + T4P4;//MMPETTAPMPPEPPP0
    var T5P4 = T4A1 + T4P2;//AAATATAPMMPETTAP
    var T5P5 = "";//
    var T5P6 = "";//

    var T5W1 = T4W4 + T4W6;//TTAPMPWWSSWEMWWE
    var T5W2 = T4W1 + T4W3;//WWWEWEKEWWWESSWE
    var T5W3 = T4M6 + T4W5;//ATMWMWPESTMMSSWE
    var T5W4 = T4T6 + T4W1;//TTKEAPPEWWWEWEKE
    var T5W5 = "";//
    var T5W6 = "";//

    var T5K1 = T4K1 + T4K2;//KKAKSKAKWWWEWWKK
    var T5K2 = T4K3 + T4K6;//ATMWSKAKMPKKWEKE
    var T5K3 = T4K2 + T4K4;//WWWEWWKKKKAKMPKK
    var T5K4 = T4P6 + T4K6;//MPPEATMPMPKKWEKE
    var T5K5 = T4M4 + T4K1;//ATAPMMMWKKAKSKAK
    var T5K6 = T4K4 + T4E3;//KKAKMPKKSKKEEEE0

    var T5E1 = T4A5 + T4E3;//AAATAAKESKKEEEE0
    var T5E2 = T4E2 + T4E4;//MWPEWEKEMPKKEEE0
    var T5E3 = T4E5 + T4E6;//MWPEEEE0MPWWMWPE
    var T5E4 = T4S1 + T4E2;//SKSSTTAPMWPEWEKE
    var T5E5 = T4P3 + T4E6;//PPP0SKAKMPWWMWPE
    var T5E6 = "";//

    heros.push(
    [
    T5S1, T5S2, T5S3, T5S4, T5S5, T5S6,
    T5A1, T5A2, T5A3, T5A4, T5A5, T5A6,
    T5T1, T5T2, T5T3, T5T4, T5T5, T5T6,
    T5M1, T5M2, T5M3, T5M4, T5M5, T5M6,
    T5P1, T5P2, T5P3, T5P4, T5P5, T5P6,
    T5W1, T5W2, T5W3, T5W4, T5W5, T5W6,
    T5K1, T5K2, T5K3, T5K4, T5K5, T5K6,
    T5E1, T5E2, T5E3, T5E4, T5E5, T5E6,
    ]);

    var element = ["Fire", "Wind", "Freeze", "Light", "Dark", "Metal"];
    var profession = ["Defence", "Damage", "Cure"];
    var tag = [];
    var heroInfos = [];

    heroInfos.push({
        Id: occupations[0],
        Name: "劍士",
        Level: "1",
        Element: element[0],
        Profession: profession[0],
        Skills: [],
        Tags: [],
    });

    heroInfos.push({
        Id: occupations[1],
        Name: "弓箭手",
        Level: "1",
        Element: element[1],
        Profession: profession[1],
        Skills: [],
        Tags: [],
    });