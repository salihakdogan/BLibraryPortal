<%@ Page Title="" Language="C#" MasterPageFile="~/yetkili/yetkili_panel.Master" AutoEventWireup="true" CodeBehind="o_s_guncelle.aspx.cs" Inherits="BLibraryPortal.yetkili.okuyucu_s_güncelle" %>
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
									<li class="breadcrumb-item" aria-current="page">Okuyucu</li>
									<li class="breadcrumb-item active"><a href="o_s_guncelle.aspx">Okuyucu Sil / Güncelle</a></li>
								</ol>
							</nav>				
					</div>					
				</div>
			</div>

			<div id="silmebasarili" runat="server" class="alert alert-info alert-dismissible fade show" role="alert" visible="false">
							<strong>Başarılı işlem!</strong> Okuyucu bilgileri silinmiştir.
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							 <span aria-hidden="true">&times;</span>
						</button>
						</div>

			<div id="silmehatali" runat="server" class="alert alert-danger alert-dismissible fade show" role="alert" visible="false">
							<strong>Hatalı işlem!</strong> Okuyucu bilgileri silinemedi.
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							 <span aria-hidden="true">&times;</span>
						</button>
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
									<th>Unvan</th>									
									<th>Ad</th>
									<th>Soyad</th>			
									<th>Telefon numarası</th>
									<th>Güncelle</th>
									<th>Sil</th>
									
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
									<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#gprmtc<%=dt.Rows[i][0] %>">Detaylı İncele</button></td>
									
                                    
									<td><%=dt.Rows[i][1] %></td>                                  
                                    <td><%=dt.Rows[i][4] %></td>
                                    <td><%=dt.Rows[i][5] %></td>                 
                                    <td><%=dt.Rows[i][7] %></td>
									<td><a href="o_guncelle.aspx?gprmtc1=<%=dt.Rows[i][0] %>" class="btn btn-outline-warning">Güncelle</a></td>
									<td><a href="" class="btn btn-outline-danger" data-toggle="modal" data-target="#silonay<%=dt.Rows[i][0] %>">Sil</a></td>
									

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

								<%for (int i = 0; i < dt.Rows.Count; i++)
								  {%>
										<div class="modal fade" id="silonay<%=dt.Rows[i][0] %>" tabindex="-1" role="dialog" aria-hidden="true">
																	<div class="modal-dialog modal-dialog-centered" role="document">
																		<div class="modal-content">
																			<div class="modal-body text-center font-18">
																				<h3 class="padding-top-30 mb-30 weight-500"><%=dt.Rows[i][4] %> <%=dt.Rows[i][5] %> isimli okuyucuyu</h3>
																				<h4 class="padding-top-30 mb-30 weight-500">silmek istediğinize emin misiniz?</h4>
																				<div class="padding-bottom-30 row" style="max-width: 170px; margin: 0 auto;">
																					<div class="col-6">
																						<button type="button" class="btn btn-secondary border-radius-100 btn-block confirmation-btn" data-dismiss="modal"><i class="fa fa-times"></i></button>
																						Hayır
																					</div>
																					<div class="col-6">
																						<a href="o_s_guncelle.aspx?silprm=<%=dt.Rows[i][0] %>">
																							<button type="button" class="btn btn-primary border-radius-100 btn-block confirmation-btn"><i class="fa fa-check"></i></button>
																						</a>
																						
																						<%--<asp:Button ID="Button1" style="display:none;" runat="server" Text="Deneme" OnClick="Button1_Click" />																						
																						<button runat="server" onserverclick="Button1_Click" type="button" class="btn btn-primary border-radius-100 btn-block confirmation-btn" data-dismiss="modal"><i class="fa fa-check"></i></button>--%>

																						Evet
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>

								<%}%>

									


</asp:Content>
