<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="frmArchive.aspx.cs" Inherits="Basar.PreparationForm.frmArchive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../js/jquery-ui.min.css" rel="stylesheet" />
    <div class="row">
        <div class="col-lg-1">
        </div>
    </div>

    <div class="col-lg-10">
        <div class="panel panel-primary div_shadow">
            <div class="panel-heading">
                <img src="../images/archivepng.png" alt="ارشيف" class="img-thumbnail" />
                <strong>الأرشيف 
                </strong>
            </div>
            <div class="panel-body">
                <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="form-horizontal">
                            <div class="alert alert-success">
                                <strong><i class="fa fa-bell"></i>ارشفة الملفات المسجلة بعد رفع الملف لا يمكنك التعديل عليه </strong>
                            </div>
                            <hr />
                            <asp:ValidationSummary runat="server" CssClass="text-danger" />
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ddlDocumentType" CssClass="col-md-2 control-label label_red">نوع المعاملة/العام</asp:Label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlDocumentType" runat="server" CssClass="form-control" DataTextField="DocumentTypeDescAr" DataValueField="DocumentTypeId" AppendDataBoundItems="True">
                                        <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control" DataTextField="YearNameAr" DataValueField="YearId" AppendDataBoundItems="True">
                                        <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <asp:Label runat="server" AssociatedControlID="ddlYear" CssClass="col-md-2 control-label label_red">رقم المعاملة</asp:Label>
                                <asp:Label ID="lblDocumentNumberDailyOut" runat="server" CssClass="col-md-2 badge label_red"></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtDocumentNumber" CssClass="col-md-2 control-label label_red">رقم المعاملة</asp:Label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtDocumentNumber" runat="server" CssClass="form-control" placeholder="رقم المعاملة" MaxLength="20"></asp:TextBox>
                                </div>
                                <asp:Label runat="server" AssociatedControlID="txtDocumentSaveNumber" CssClass="col-md-2 control-label label_red">رقم ملف الحفظ</asp:Label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtDocumentSaveNumber" runat="server" CssClass="form-control" placeholder="رقم المعاملة" MaxLength="20"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtDocumentDate" CssClass="col-md-2 control-label label_red">تاريخ المعاملة</asp:Label>
                                <div class="col-md-3 has-feedback">
                                    <asp:TextBox ID="txtDocumentDate" runat="server" CssClass="form-control" placeholder="تاريخ المعاملة" MaxLength="10"></asp:TextBox>
                                    <i class="fa fa-calendar fa-2x form-control-feedback" id="ical"></i>
                                </div>
                                <asp:Label runat="server" AssociatedControlID="txtDocumentAttachNumber" CssClass="col-md-2 col-md-offset-1 control-label label_red">المرفقات</asp:Label>
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtDocumentAttachNumber" runat="server" CssClass="form-control" placeholder="المرفقات" MaxLength="10"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtDocumentPlace" CssClass="col-md-2 control-label label_red">الجهة</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtDocumentPlace" runat="server" CssClass="form-control" placeholder="الجهة" MaxLength="50"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtDocumentSubject" CssClass="col-md-2 control-label label_red">الموضوع</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtDocumentSubject" runat="server" CssClass="form-control" placeholder="الموضوع" MaxLength="100"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtSearchWords" CssClass="col-md-2 control-label label_red">كلمات البحث</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtSearchWords" runat="server" CssClass="form-control" Rows="5" TextMode="MultiLine" placeholder="كل سطر يعتبر كلمة بحث جديده"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <asp:GridView ID="gvDocumentAttchment" runat="server" AutoGenerateColumns="False" EmptyDataText="لا يوجد مرفق" CssClass="table table-bordered table-hover" OnRowCommand="gvDocumentAttchment_RowCommand" OnPageIndexChanging="gvDocumentAttchment_PageIndexChanging" AllowPaging="True">
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
                                                    الملف
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnDocumentFileName" runat="server" Text='<%# Bind("DocumentFileName")  %>' CommandName="cnOpenFile">  </asp:LinkButton>
                                                    <asp:HiddenField ID="hfMyFile" runat="server" Value='<%# Bind("MyFile")  %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="fuDocument" CssClass="col-md-2 control-label label_red">الملف</asp:Label>
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
                                    <input type="button" id="btnUpload" value="تحميل الملف" class="btn btn-default" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:CheckBox ID="cbIsModifyed" runat="server" Text=" عدم التعديل على المعاملة لاحفا" CssClass="checkbox-inline text-danger col-md-offset-2" />
                                <asp:LinkButton ID="lbtnSearch" runat="server" Text="" CssClass="btn btn-success col-md-offset-1" OnClick="lbtnSearch_Click1">
                                    <span class="fa fa-search"> </span>
                                    بحث
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnSend" runat="server" Text="" CssClass="btn btn-success col-md-offset-1" OnClick="btnSend_Click">
                                    <span class="fa fa-floppy-o"> </span>
                                    حفظ
                                </asp:LinkButton>
                                <asp:LinkButton ID="lbtnClear" runat="server" Text="" CssClass="btn btn-success" OnClick="lbtnClear_Click">
                                    <span class="fa fa-file-archive-o"> </span>
                                    مسح الشاشة
                                </asp:LinkButton>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <asp:GridView ID="gvDocuments" runat="server" AutoGenerateColumns="False" EmptyDataText="لا يوجد مرفق" CssClass="table table-bordered table-hover" AllowPaging="True" OnDataBound="gvDocuments_DataBound" OnRowCommand="gvDocuments_RowCommand" OnPageIndexChanging="gvDocuments_PageIndexChanging">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <label for="MBCountLabel" class="label_red">م</label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="MBCountLabel" CssClass="label_red" runat="server"
                                                        Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                                    <asp:Image ID="imgStatus" runat="server" Height="36px" Width="36px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    نوع المعاملة
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnDocumentTypeDescAr" runat="server" Text='<%# Bind("DocumentTypeDescAr")  %>'>  </asp:LinkButton>
                                                    <asp:HiddenField ID="hfDocumentId" runat="server" Value='<%# Bind("DocumentId")  %>' />
                                                    <asp:HiddenField ID="hfDocumentFileName" runat="server" Value='<%# Bind("DocumentFileName")  %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    الرقم
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnDocumentNumberDaily" runat="server" Text='<%# Bind("DocumentNumberDaily")  %>'>  </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    الموضوع
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnDocumentSubject" runat="server" Text='<%# Bind("DocumentSubject")  %>'>  </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    رقم المعاملة
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnDocumentNumber" runat="server" Text='<%# Bind("DocumentNumber")  %>'>  </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                   <i class="fa fa-file-archive-o fa-2x"></i>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnOpenFile" runat="server" CommandName="selectFiles"> 
                                                            <span class="fa fa-file-archive-o fa-2x" title="الوثائق"></span>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField>
                                                <HeaderTemplate>
                                                   <i class="fa fa-edit fa-2x"></i>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="cnEdit"> 
                                                            <span class="fa fa-edit fa-2x" title="التعديل"></span>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerSettings PageButtonCount="10" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSend" EventName="Click" />
                          
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <script src="../js/jquery-1.11.0.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jsUploadFiles.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            uploadFileArchiveClient();
        });
        function uploadFileArchiveClient() {

            $("#btnUpload").click(function (event) {
                var year = "<%=ddlYear.ClientID %>";
                var documentType = "<%=ddlDocumentType.ClientID %>";
                var docNum = $("#<%=lblDocumentNumberDailyOut.ClientID %>").text();

                if (getSelectValue(year) === '-1' || getSelectValue(year) === '' || getSelectValue(year) === null) {
                    alert('العام');
                    return;
                }
                else if (getSelectValue(documentType) === '-1' || getSelectValue(documentType) === '' || getSelectValue(documentType) === null) {
                    alert('نوع المعاملة');
                    return;
                }

                else if (docNum === '' || docNum === null) {
                    alert('يجب حفظ المعاملة أولا');
                    return;
                }
                else {
                    if (docNum === '' || docNum === null) {

                        docNum = "No Number";
                    }
                    var fupload = $("#<%=fuDocument.ClientID %>");
                    var myurl = '../BasarService/ArchiveUpload.ashx?yearText=' + getSelectText(year) + '&dateFolder=';
                    uploadFileArchive(event, fupload, getSelectValue(year), myurl, getSelectText(documentType), docNum, getSelectValue(documentType));
                }




            });
        }
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm !== null) {
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate !== null) {
                    uploadFileArchiveClient();
                }
            });
        }
    </script>
</asp:Content>
