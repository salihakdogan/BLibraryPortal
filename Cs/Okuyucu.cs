using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLibraryPortal.Cs
{
    public class Okuyucu
    {
        string tc, unvan, sinif, ad, soyad, cinsiyet, tel;
        int no, puan;
        DateTime dtarih;

        public string Tc { get => tc; set => tc = value; }
        public string Unvan { get => unvan; set => unvan = value; }
        public string Sinif { get => sinif; set => sinif = value; }
        public string Ad { get => ad; set => ad = value; }
        public string Soyad { get => soyad; set => soyad = value; }
        public string Cinsiyet { get => cinsiyet; set => cinsiyet = value; }
        public string Tel { get => tel; set => tel = value; }
        public int No { get => no; set => no = value; }
        public int Puan { get => puan; set => puan = value; }
        public DateTime Dtarih { get => dtarih; set => dtarih = value; }
    }
}