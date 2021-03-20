<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="frmBanner.aspx.cs" Inherits="Basar.PreparationForm.frmBanner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../js/jquery-ui.min.css" rel="stylesheet" />
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-10">
            <div class="panel panel-primary div_shadow">
                <div class="panel-heading">
                    <i class="fa fa-photo fa-2x"></i> 
                    <strong>بنر الميخم 
                    </strong>
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="form-horizontal">
                                  <div class="alert alert-danger">
                                    <strong><i class="fa fa-bell"></i> يجب تحميل البنر والتأكد من رفعه قبل ارسال البنر للطباعة </strong>
                                </div>

                                <hr />
                              
                                <asp:ValidationSummary runat="server" CssClass="text-danger" />
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="ddlYear" CssClass="col-md-2 control-label label_red">العام</asp:Label>
                                    <div class="col-md-4">
                                        <div class="custom-search-form">
                                            <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control" DataTextField="YearNameAr" DataValueField="YearId"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <asp:Label runat="server" AssociatedControlID="ddlToure" CssClass="col-md-2 control-label label_red">الجولة</asp:Label>
                                    <div class="col-md-4">
                                        <div class="input-group custom-search-form">
                                            <asp:DropDownList ID="ddlToure" runat="server" CssClass="form-control" DataTextField="TourDsecAr" DataValueField="TourId" AutoPostBack="True" OnSelectedIndexChanged="ddlToure_SelectedIndexChanged"></asp:DropDownList>
                                        </div>

                                    </div>

                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="ddlCountries" CssClass="col-md-2 control-label label_red">الدولة</asp:Label>
                                    <div class="col-md-4">
                                        <div class="input-group custom-search-form">
                                            <asp:DropDownList ID="ddlCountries" runat="server" DataTextField="CountryDsecAr" DataValueField="CountryId" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged">
                                                <asp:ListItem Value="-1">الدولــة</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>
                                    <asp:Label runat="server" AssociatedControlID="ddlCamps" CssClass="col-md-2 control-label label_red">المخيم
                                    </asp:Label>
                                    <div class="col-md-3">
                                        <div class="input-group custom-search-form">
                                            <asp:DropDownList ID="ddlCamps" runat="server" DataTextField="CampDsecAr" DataValueField="CampId" CssClass="form-control">
                                                <asp:ListItem Value="-1">اختر المخيم</asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="input-group-btn">
                                                <asp:LinkButton class="btn btn-default" ID="lbtnSearch" runat="server" CausesValidation="false" OnClick="lbtnSearch_Click">
                                                <i class="fa fa-search"></i>
                                                </asp:LinkButton>
                                            </span>
                                        </div>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="fuDocument" CssClass="col-md-2 control-label label_red">البانر</asp:Label>
                                    <div class="col-md-4">
                                        <asp:FileUpload ID="fuDocument" runat="server" AllowMultiple="true" CssClass="btn-default" />
                                        <div>
                                            <div id="progressbar" style="position: relative; display: none">
                                                <span style="position: absolute; left: 35%; top: 20%" id="progressBar-label">Uploading...
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <input type="button" id="btnUpload" value="تحميل الملف" class="btn btn-primary" />
                                    </div>
                                  
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="txtBannerDesc" CssClass="col-md-2 control-label label_red">الوصف</asp:Label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txtBannerDesc" runat="server" CssClass="form-control" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:CheckBox ID="cbBannerStatus" runat="server" Text="تم الموافقة على البنر بشكل نهائي" CssClass="checkbox-inline text-danger col-md-offset-2"    />
                                    <asp:LinkButton ID="btnSend" runat="server" Text="" CssClass="btn btn-primary col-md-offset-1" OnClick="btnSend_Click">
                                        
                                    <span class="fa fa-send"> </span>
                                    ارسال البانر
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lbtnClear" runat="server" Text="" CssClass="btn btn-primary" OnClick="lbtnClear_Click">
                                    <span class="fa fa-minus"> </span>
                                    مسح الشاشة
                                    </asp:LinkButton>
                                </div>
                                <div class="form-group">
                                      <div class="col-md-12">
                                        <asp:GridView ID="gvBannerAttachment" runat="server" AutoGenerateColumns="False"  EmptyDataText="لا يوجد مرفق"  CssClass="table table-bordered table-hover" AllowPaging="True"  OnPageIndexChanging="gvBannerAttachment_PageIndexChanging">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <label for="MBCountLabel" class="label_red">م</label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="MBCountLabel" CssClass="label_red" runat="server"
                                                        Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    البنر
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnYearNameAr" runat="server" Text='<%# Bind("YearNameAr")  %>'>  </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField>
                                                <HeaderTemplate>
                                                    الجولة
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnTourDsecAr" runat="server" Text='<%# Bind("TourDsecAr")  %>'>  </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField>
                                                <HeaderTemplate>
                                                    الدولة
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnCountryDsecAr" runat="server" Text='<%# Bind("CountryDsecAr")  %>'>  </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField>
                                                <HeaderTemplate>
                                                    المخيم
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnCampDsecAr" runat="server" Text='<%# Bind("CampDsecAr")  %>'>  </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerSettings PageButtonCount="5" />
                                    </asp:GridView>
                                    </div>

                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <script src="../js/jquery-1.11.0.js"></script>
            <script src="../js/jquery-ui.min.js"></script>
            <script src="../js/jsUploadFiles.js"></script>
            <script type="text/javascript">
                $(document).ready(function () {
                    uploadFiles();
                });
                function uploadFiles() {

                    $("#btnUpload").click(function (event) {
                        var year = "<%=ddlYear.ClientID %>";
                        var tour = "<%=ddlToure.ClientID %>";
                        var country = "<%=ddlCountries.ClientID %>";
                        var camp = "<%=ddlCamps.ClientID %>";
                        if (getSelectValue(year) === '-1' || getSelectValue(year) === '' || getSelectValue(year) === null) {
                            alert('عام الخطة');
                            return;
                        }
                        else if (getSelectValue(tour) === '-1' || getSelectValue(tour) === '' || getSelectValue(tour) === null) {
                            alert('الجولة');
                            return;
                        }
                        else if (getSelectValue(country) === '-1' || getSelectValue(country) === '' || getSelectValue(country) === null) {
                            alert('الدولة');
                            return;
                        }
                        else if (getSelectValue(camp) === '-1' || getSelectValue(camp) === '' || getSelectValue(camp) === null) {
                            alert('المخيم');
                            return;
                        }
                        else {
                            var fupload = $("#<%=fuDocument.ClientID %>");
                            var myurl = '../BasarService/BannerUpload.ashx?yearText=' + getSelectText(year) + "&dateFolder=";
                            uploadFile(event, fupload,   getSelectText(tour), getSelectText(country), getSelectText(camp),
                              getSelectValue(year),  getSelectValue(tour),getSelectValue(country),getSelectValue(camp),
                                myurl);
                        }



                    });
                }
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                if (prm !== null) {
                    prm.add_endRequest(function (sender, e) {
                        if (sender._postBackSettings.panelsToUpdate !== null) {
                            uploadFiles();
                        }
                    });
                }

            </script>
</asp:Content>
