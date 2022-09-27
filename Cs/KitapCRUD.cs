using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BLibraryPortal.Cs
{
    public class KitapCRUD
    {
        Db db = new Db();

        public bool ekle(Kitap kitap)
        {
            bool sonuc = true;
            db.ac();
            SqlCommand komut = new SqlCommand("insert into TblKitap values(@1,@2,@3,@4,@5,@6,@7,@8)", db.baglanti);

            komut.Parameters.AddWithValue("@1", kitap.Isbn);
            komut.Parameters.AddWithValue("@2", kitap.Ad);
            komut.Parameters.AddWithValue("@3", kitap.Yazarno);
            komut.Parameters.AddWithValue("@4", kitap.Turno);
            komut.Parameters.AddWithValue("@5", kitap.Sayfa);
            komut.Parameters.AddWithValue("@6", kitap.Puan);
            komut.Parameters.AddWithValue("@7", kitap.Resim);
            komut.Parameters.AddWithValue("@8", 0);

            int durum = Convert.ToInt16(komut.ExecuteNonQuery());

            if (durum == 0)
            {
                sonuc = false;
            }

            db.kapat();

            return sonuc;
        }

        public DataTable yazarliste()
        {
            DataTable dt0 = new DataTable();

            db.ac();
            SqlCommand komut0 = new SqlCommand("select distinct y_no,y_ad+' '+y_soyad as yazar_adi from TblYazar", db.baglanti);
            SqlDataAdapter adp0 = new SqlDataAdapter(komut0);
            adp0.Fill(dt0);
            db.kapat();
            return dt0;
        }

        public DataTable turliste()
        {
            DataTable dt1 = new DataTable();

            db.ac();
            SqlCommand komut1 = new SqlCommand("select distinct t_no,t_ad from TblTur", db.baglanti);
            SqlDataAdapter adp1 = new SqlDataAdapter(komut1);
            adp1.Fill(dt1);
            db.kapat();
            return dt1;
        }
        public DataTable kitapliste()
        {
            DataTable dt = new DataTable();

            db.ac();
            SqlCommand komut = new SqlCommand("select TblKitap.k_no, TblKitap.k_isbn, TblKitap.k_adi, " +
                "TblYazar.y_ad, TblYazar.y_soyad, TblTur.t_ad, TblKitap.k_sayfa, TblKitap.k_puan, " +
                "TblKitap.k_resim from TblKitap, TblYazar, TblTur " +
                "where TblKitap.k_yazar_no=TblYazar.y_no and TblKitap.k_tur_no=TblTur.t_no", db.baglanti);
            SqlDataAdapter adp = new SqlDataAdapter(komut);
            adp.Fill(dt);

            db.kapat();
            return dt;
        }      
    }
}