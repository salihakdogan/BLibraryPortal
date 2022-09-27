<%@ Page Title="" Language="C#" MasterPageFile="~/yetkili/yetkili_panel.Master" AutoEventWireup="true" CodeBehind="i_odunc.aspx.cs" Inherits="BLibraryPortal.yetkili.i_odunc" %>
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
									<li class="breadcrumb-item" aria-current="page">İşlemler</li>
									<li class="breadcrumb-item active"><a href="i_odunc.aspx">Kitap Ödünç Ver</a></li>
								</ol>
							</nav>
					</div>					
				</div>
			</div>

			<div id="okuyucuyok" runat="server" class="alert alert-success alert-dismissible fade show" role="alert" visible="false">
							<strong>Hatalı işlem!</strong> Bu kayıtta tc bulunamadı.
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							 <span aria-hidden="true">&times;</span>
						</button>
						</div>
		<form>

			<div class="pd-20 card-box mb-30">

				<div class="clearfix">
						<div class="pull-left">
							<h4 class="text-blue h4">Kitap ödünç verme ekranı</h4>
							<p class="mb-30">Okuyucu bilgilerini lütfen doğru giriniz.</p>
						</div>
						
					</div>

				

					<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">TC Kimlik Numarası</label>
							
							<div class="col-sm-6 col-md-5">								
								<asp:TextBox ID="TextBox1" runat="server" class="form-control" type="text" placeholder=""></asp:TextBox>
							</div>

							<div class="col-sm-6 col-md-5">
								<asp:Button ID="Button1" runat="server" Text="Ara" CssClass="btn btn-primary" OnClick="Button1_Click" ValidationGroup="oduncver" data-target="#gprm<%=dt.Rows[i][0] %>"/>

							</div>
							
							<div class="col-sm-6 col-md-5 col-form-label">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="TC Kimlik numarası alanı boş bırakılamaz." ControlToValidate="TextBox1" Font-Size="Small" ForeColor="#EF5A5A" ValidationGroup="kitapkayit"></asp:RequiredFieldValidator>
							</div>														
						</div>


						<div id="okuyucugoster" runat="server">
							
						</div>

			</div>

			<div id="kitapgoster" runat="server" visible="false">

							<div class="card-box mb-30">
					<div class="pd-20">
						<h4 class="text-blue h4">Kitaplar Listesi</h4>
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
									<th>Kitap seç</th>
									<th>ISBN numarası</th>
									<th>Kitap adı</th>									
									<th>Sayfa sayısı</th>
									
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
									<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#gprm<%=dt.Rows[i][0] %>">Seç</button></td>
									<td><%=dt.Rows[i][1] %></td>
                                    <td><%=dt.Rows[i][2] %></td>                                  
                                    <td><%=dt.Rows[i][5] %></td>                            

								</tr>
								
								<%} %>

							</tbody>
						</table>

						<%--kitap seç modal baslangic--%>
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
												<td><img alt="" src="<%=dt.Rows[i][8] %>" Height="75" Width="75"/></td>
												</tr>
																								
												</table>
													
												</div>
												   

											   </div>

													<div class="modal-footer">
														<button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#kayitbitis">Seç</button>
														<button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
														<%--<button type="button" class="btn btn-primary">Save changes</button>--%>
													</div>
																						
											</div>
										  </div>
										</div>
								
						<%} %> 

						<%--kitap seç modal bitiş--%>


						<%--kitap seç son aşama başlangıç--%>

						<div class="modal fade" id="kayitbitis" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
									<h5 class="modal-title" id="exampleModalToggleLabel2">Modal 2</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							  </div>
							  <div class="modal-body">
								Hide this modal and show the first with the button below.
							  </div>
							  <div class="modal-footer">
								<button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">Back to first</button>
							  </div>
							</div>
						  </div>
						</div>
						<a class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button">Open first modal</a>


						<%--kitap seç son aşama başlangıç--%>

					</div>
				</div>

			</div>
			
		</form>

        </div>
    </div>

	


</asp:Content>
