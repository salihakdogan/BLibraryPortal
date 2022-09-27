<%@ Page Title="" Language="C#" MasterPageFile="~/yetkili/yetkili_panel.Master" AutoEventWireup="true" CodeBehind="k_listele.aspx.cs" Inherits="BLibraryPortal.yetkili.k_listele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="main-container">
        <div class="pd-ltr-20">

            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4><a href="index.aspx">Anasayfa</a></h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item" aria-current="page">Kitap</li>
                                <li class="breadcrumb-item active"><a href="k_listele.aspx">Kitap Listele</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="card-box mb-30">
                <div class="pd-20">
                    <h4 class="text-blue h4">Kitaplar Listesi</h4>
                </div>
                <div class="pb-20">
                    <table class="checkbox-datatable table nowrap">
                        <thead>
                            <tr>
                                <th>
                                    <div class="dt-checkbox">
                                        <input type="checkbox" name="select_all" value="1" id="example-select-all">
                                        <span class="dt-checkbox-label"></span>
                                    </div>
                                </th>
                                <th>Detaylı incele</th>
                                <th>ISBN numarası</th>
                                <th>Kitap adı</th>
                                <th>Kitap görseli</th>

                            </tr>
                        </thead>

                        <% BLibraryPortal.Cs.KitapCRUD kitap = new BLibraryPortal.Cs.KitapCRUD();
                            System.Data.DataTable dt = new System.Data.DataTable();
                            dt = kitap.kitapliste();
                        %>

                        <tbody>

                            <%for (int i = 0; i < dt.Rows.Count; i++)
                                {%>

                            <tr>
                                <td></td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#gprm<%=dt.Rows[i][0] %>">Detaylı İncele</button></td>
                                <td><%=dt.Rows[i][1] %></td>
                                <td><%=dt.Rows[i][2] %></td>
                                <td>
                                    <img alt="" src="<%=dt.Rows[i][8] %>" height="75" width="75" /></td>

                           </tr>

                            <%} %>
                        </tbody>
                    </table>
                </div>
            </div>


            <%for (int i = 0; i < dt.Rows.Count; i++)
                {%>
            <div id="gprm<%=dt.Rows[i][0] %>" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h4 class="modal-title" id="myLargeModalLabel">Kitabın detaylı bilgileri:</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>

                        <div class="modal-body">

                            <div class="table-responsive">
                                <table class="table table-striped">


                                    <tr>
                                        <td>Kitap no</td>
                                        <td>:</td>
                                        <td><%=dt.Rows[i][0] %></td>
                                    </tr>

                                    <tr>
                                        <td>ISBN no</td>
                                        <td>:</td>
                                        <td><%=dt.Rows[i][1] %></td>
                                    </tr>

                                    <tr>
                                        <td>Kitap adı</td>
                                        <td>:</td>
                                        <td><%=dt.Rows[i][2] %></td>
                                    </tr>

                                    <tr>
                                        <td>Kitap yazarı</td>
                                        <td>:</td>
                                        <td><%=dt.Rows[i][3]+" " %><%=dt.Rows[i][4] %></td>
                                    </tr>

                                    <tr>
                                        <td>Kitap türü</td>
                                        <td>:</td>
                                        <td><%=dt.Rows[i][5] %></td>
                                    </tr>

                                    <tr>
                                        <td>Sayfa</td>
                                        <td>:</td>
                                        <td><%=dt.Rows[i][6] %></td>
                                    </tr>

                                    <tr>
                                        <td>Puan</td>
                                        <td>:</td>
                                        <td><%=dt.Rows[i][7] %></td>
                                    </tr>

                                    <tr>
                                        <td>Resim</td>
                                        <td>:</td>
                                        <%--<td><%=dt.Rows[i][8] %></td>--%>
                                        <td>
                                            <img alt="" src="<%=dt.Rows[i][8] %>" height="75" width="75" /></td>
                                    </tr>

                                    <%--<%int gnumara;

                                                    gnumara = Convert.ToInt16(dt.Rows[i][2]);

                                                    if (gnumara == 0)
                                                    {
                                                        dt.Rows[i][2] = "Numara bilgisi bulunmamaktadır.";
                                                    }
                                                    else
                                                    {
														gnumara = Convert.ToInt16(dt.Rows[i][2]);
                                                    }

												%>

												<%string gsinif;

                                                    gsinif = Convert.ToString(dt.Rows[i][3]);

                                                    if (gsinif == "")
                                                    {
                                                        dt.Rows[i][3] = "Sınıf bilgisi bulunmamaktadır.";
                                                    }
                                                    else
                                                    {
														gsinif = Convert.ToString(dt.Rows[i][3]);
                                                    }

												%>--%>

                                    <%--<tr>
												<td>Okul numarası</td>
												<td>:</td>
												<td><%=dt.Rows[i][2] %></td>
												</tr>

												<tr>
												<td>Sınıf</td>
												<td>:</td>
												<td><%=dt.Rows[i][3] %></td>
												</tr>--%>
                                </table>

                            </div>


                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Kapat</button>
                            <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
                        </div>

                    </div>
                </div>
            </div>
            <%} %>
        </div>
    </div>

</asp:Content>
