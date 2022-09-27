using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BLibraryPortal.Cs
{
    public class OkuyucuCRUD
    {
        Db db = new Db();

        public bool ekle(Okuyucu okuyucu)
        {
            bool sonuc = true;
            db.ac();
            SqlCommand komut = new SqlCommand("insert into TblOkuyucu values(@1,@2,@3,@4,@5,@6,@7,@8,@9,@10)", db.baglanti);

            komut.Parameters.AddWithValue("@1", okuyucu.Tc);
            komut.Parameters.AddWithValue("@2", okuyucu.Unvan);
            komut.Parameters.AddWithValue("@3", okuyucu.No);
            komut.Parameters.AddWithValue("@4", okuyucu.Sinif);
            komut.Parameters.AddWithValue("@5", okuyucu.Ad);
            komut.Parameters.AddWithValue("@6", okuyucu.Soyad);
            komut.Parameters.AddWithValue("@7", okuyucu.Cinsiyet);
            komut.Parameters.AddWithValue("@8", okuyucu.Tel);
            komut.Parameters.AddWithValue("@9", okuyucu.Dtarih);
            komut.Parameters.AddWithValue("@10", okuyucu.Puan);

            int durum = Convert.ToInt16(komut.ExecuteNonQuery());

            if (durum == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }

        public bool tconay(string ptc)
        {
            bool sonuc = true;
            db.ac();
            SqlCommand komut = new SqlCommand("select count(*) from TblOkuyucu where o_tc=@1", db.baglanti);

            komut.Parameters.AddWithValue("@1", ptc);
            
            int kytsayi = Convert.ToInt16(komut.ExecuteScalar()); /*sayı parametresi taşırken 1-0 gibi scalar kullanılır*/

            if (kytsayi==0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;           
        }

        public DataTable liste()
        {           
            DataTable dt = new DataTable();

            db.ac();
            SqlCommand komut = new SqlCommand("select * from TblOkuyucu", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);

            db.kapat();
            return dt;
        }

        public DataTable okuyucugoster(string gtc)
        {
            DataTable gdt = new DataTable();
            db.ac();

            SqlCommand goster = new SqlCommand("select * from TblOkuyucu where o_tc=@1", db.baglanti);
            goster.Parameters.AddWithValue("@1", gtc);
            SqlDataAdapter adp = new SqlDataAdapter(goster);
            adp.Fill(gdt);
            
            db.kapat();
            return gdt;
        }

        public bool guncelle(Okuyucu okuyucugoster)
        {
            bool cevap = true;
            db.ac();
            SqlCommand guncelleme = new SqlCommand("update TblOkuyucu set o_unvan=@a, o_no=@b, o_sinif=@c, o_ad=@d, o_soyad=@e, o_cinsiyet=@f, o_telno=@g, o_dtarih=@h, o_puan=@i where o_tc=@j", db.baglanti);
            
            guncelleme.Parameters.AddWithValue("@a", okuyucugoster.Unvan);
            guncelleme.Parameters.AddWithValue("@b", okuyucugoster.No);
            guncelleme.Parameters.AddWithValue("@c", okuyucugoster.Sinif);
            guncelleme.Parameters.AddWithValue("@d", okuyucugoster.Ad);
            guncelleme.Parameters.AddWithValue("@e", okuyucugoster.Soyad);
            guncelleme.Parameters.AddWithValue("@f", okuyucugoster.Cinsiyet);
            guncelleme.Parameters.AddWithValue("@g", okuyucugoster.Tel);
            guncelleme.Parameters.AddWithValue("@h", okuyucugoster.Dtarih);
            guncelleme.Parameters.AddWithValue("@i", okuyucugoster.Puan);
            guncelleme.Parameters.AddWithValue("@j", okuyucugoster.Tc);

            int donus = guncelleme.ExecuteNonQuery();
            
            if (donus==0)
            {
                cevap = false;
            }
            
            db.kapat();
            return cevap;
        }
        
        public bool sil(string gtc)
        {
            bool cevap = true; //silindi
            db.ac();
            SqlCommand silme = new SqlCommand("delete from TblOkuyucu where o_tc=@1", db.baglanti);
            silme.Parameters.AddWithValue("@1",gtc);
            int bilgi = silme.ExecuteNonQuery();

            if (bilgi==0)
            {
                cevap = false; //silinemedi
            }

            db.kapat();
            return cevap;
        }

        public DataTable islemtc(string itc)
        {
            DataTable gdt = new DataTable();
            db.ac();

            SqlCommand goster = new SqlCommand("select * from TblOkuyucu where o_tc=@1", db.baglanti);
            goster.Parameters.AddWithValue("@1", itc);
            SqlDataAdapter adp = new SqlDataAdapter(goster);
            adp.Fill(gdt);

            db.kapat();
            return gdt;
        }



    }
        
}