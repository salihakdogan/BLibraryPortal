using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLibraryPortal.Cs
{
    public class Kitap
    {
        string isbn, ad, resim;
        int yazarno, turno, sayfa, puan;

        public string Isbn { get => isbn; set => isbn = value; }
        public string Ad { get => ad; set => ad = value; }
        public string Resim { get => resim; set => resim = value; }
        public int Yazarno { get => yazarno; set => yazarno = value; }
        public int Turno { get => turno; set => turno = value; }
        public int Sayfa { get => sayfa; set => sayfa = value; }
        public int Puan { get => puan; set => puan = value; }
    }
}