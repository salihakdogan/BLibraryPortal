using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BLibraryPortal.Cs
{
    public class DroplistCRUD
    {
        Db db = new Db();

        public bool yazarekle(Droplist droplist1)
        {
            bool sonuc = true;
            db.ac();

            SqlCommand komut = new SqlCommand("insert into TblYazar values (@1,@2)", db.baglanti);

            komut.Parameters.AddWithValue("@1", droplist1.Yazarad);
            komut.Parameters.AddWithValue("@2", droplist1.Yazarsoyad);

            int durum = Convert.ToInt16(komut.ExecuteNonQuery());

            if (durum == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }

        public bool turekle(Droplist droplist2)
        {
            bool sonuc = true;
            db.ac();

            SqlCommand komut = new SqlCommand("insert into TblTur values (@1)", db.baglanti);

            komut.Parameters.AddWithValue("@1", droplist2.Turad);

            int durum = Convert.ToInt16(komut.ExecuteNonQuery());

            if (durum == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }
    }
}