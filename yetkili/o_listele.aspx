﻿<%@ Page Title="" Language="C#" MasterPageFile="~/yetkili/yetkili_panel.Master" AutoEventWireup="true" CodeBehind="o_listele.aspx.cs" Inherits="BLibraryPortal.yetkili.okuyucu_listele" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div class="app-main__inner">
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
									<li class="breadcrumb-item" aria-current="page">Okuyucu</li>
									<li class="breadcrumb-item active"><a href="o_listele.aspx">Okuyucu Listele</a></li>
								</ol>
							</nav>				
					</div>					
				</div>
			</div>

    <div class="card-box mb-30">
					<div class="pd-20">
						<h4 class="text-blue h4">Okuyucular Listesi</h4>
					</div>
					<div class="pb-20">
						<table class="checkbox-datatable table nowrap">					
							<thead>
								<tr>
									<th><div class="dt-checkbox">
											<input type="checkbox" name="select_all" value="1" id="example-select-all">
											<span class="dt-checkbox-label"></span>
										</div>
									</th>
									<th>Detaylı incele</th>
									<th>TC kimlik numarası</th>
									<th>Unvan</th>									
									<th>Ad</th>
									<th>Soyad</th>
									<th>Cinsiyet</th>
									<th>Telefon numarası</th>
									<th>Doğum tarihi</th>
									<th>Puan</th>
								</tr>
							</thead>

							<% BLibraryPortal.Cs.OkuyucuCRUD okuyucu = new BLibraryPortal.Cs.OkuyucuCRUD();
                                System.Data.DataTable dt = new System.Data.DataTable();
                                dt = okuyucu.liste();
                                %>

							<tbody>

								<%for (int i = 0; i < dt.Rows.Count; i++)
                                          {%>

								<tr>
									<td></td>
									<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#gprm<%=dt.Rows[i][0] %>">Detaylı İncele</button></td>
									<td><%=dt.Rows[i][0] %></td>
                                    <td><%=dt.Rows[i][1] %></td>                                  
                                    <td><%=dt.Rows[i][4] %></td>
                                    <td><%=dt.Rows[i][5] %></td>
                                    <td><%=dt.Rows[i][6] %></td>
                                    <td><%=dt.Rows[i][7] %></td>
                                    <td><%=Convert.ToDateTime(dt.Rows[i][8]).ToShortDateString() %></td>
                                    <td><%=dt.Rows[i][9] %></td>

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
											<h4 class="modal-title" id="myLargeModalLabel">Okuyucunun detaylı bilgileri:</h4>
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										</div>

											   <div class="modal-body">
												
												<div class="table-responsive">
												<table class="table table-striped">
																							
												
												<tr>
												<td>Tc kimlik no</td>
												<td>:</td>
												<td><%=dt.Rows[i][0] %></td>
												</tr>

												<tr>
												<td>Ünvan</td>
												<td>:</td>
												<td><%=dt.Rows[i][1] %></td>
												</tr>

												<tr>
												<td>Ad</td>
												<td>:</td>
												<td><%=dt.Rows[i][4] %></td>
												</tr>

												<tr>
												<td>Soyad</td>
												<td>:</td>
												<td><%=dt.Rows[i][5] %></td>
												</tr>

												<tr>
												<td>Cinsiyet</td>
												<td>:</td>
												<td><%=dt.Rows[i][6] %></td>
												</tr>

												<tr>
												<td>Telefon Numarası</td>
												<td>:</td>
												<td><%=dt.Rows[i][7] %></td>
												</tr>

												<tr>
												<td>Doğum tarihi</td>
												<td>:</td>
												<td><%=Convert.ToDateTime(dt.Rows[i][8]).ToShortDateString() %></td>
												</tr>

												<tr>
												<td>Puan</td>
												<td>:</td>
												<td><%=dt.Rows[i][9] %></td>
												</tr>												
													
												<%int gnumara;

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

												%>

												<tr>
												<td>Okul numarası</td>
												<td>:</td>
												<td><%=dt.Rows[i][2] %></td>
												</tr>

												<tr>
												<td>Sınıf</td>
												<td>:</td>
												<td><%=dt.Rows[i][3] %></td>
												</tr>
												

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
</div>
</asp:Content>
