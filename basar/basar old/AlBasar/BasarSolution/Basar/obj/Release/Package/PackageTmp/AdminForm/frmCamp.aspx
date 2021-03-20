<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="frmCamp.aspx.cs" Inherits="Basar.AdminForm.frmCamp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- /.row -->
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-10">
            <div class="panel panel-primary div_shadow">
                <div class="panel-heading">
                    <h4>ادخال المخيمات والتعديل عليها</h4>
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <!--row-->
                            <div class="row">
                                <!--Form Horizintal-->
                                <div class="form-horizontal">
                                    <hr />
                                    <asp:ValidationSummary runat="server" CssClass="text-danger" />
                                    <div class="form-group">

                                        <label for="ddlCountry" class="col-md-2 col-md-offset-1">الدولة</label>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control" DataTextField="CountryDsecAr" DataValueField="CountryId"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="txtCampDsecAr" class="col-md-2 col-md-offset-1">المخيم</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtCampDsecAr" runat="server" placeholder="المخيم" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvtxtCampDsecAr" runat="server" CssClass="col-md-5 text-danger" ErrorMessage="إسم المخيم" Display="Dynamic" SetFocusOnError="True" ToolTip=" إسم المخيم" Text="إسم المخيم" ControlToValidate="txtCampDsecAr"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="txtCampDsecEn" class="col-md-2 col-md-offset-1">Camp</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtCampDsecEn" runat="server" placeholder="Camp Name" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="rblTourStatus" class="col-md-2 col-md-offset-1">الحالة</label>
                                        <div class="col-md-4">

                                            <asp:RadioButtonList ID="rblCampStatus" runat="server" CssClass="control-label" RepeatDirection="Horizontal" Style="width: 100%" RepeatColumns="2">
                                                <asp:ListItem Value="true" Text="نشط" class="text-success"></asp:ListItem>
                                                <asp:ListItem Value="false" class="text-danger" Text="غير نشط"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvrblCampStatus" runat="server" CssClass="col-md-5 text-danger" ErrorMessage="حالة المخيم" Display="Dynamic" SetFocusOnError="True" ToolTip=" حالة المخيم" Text="*" ControlToValidate="rblCampStatus"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-3 col-md-offset-1">
                                            <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Button ID="btnView" runat="server" Text="عرض المخيمات" CssClass="btn btn-primary" OnClick="btnView_Click" CausesValidation="false" />
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Button ID="btnNew" runat="server" Text="جديد" CssClass="btn btn-primary" OnClick="btnNew_Click" CausesValidation="false" />

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-11 col-md-offset-1">
                                            <asp:GridView ID="gvExists" runat="server" AutoGenerateColumns="False" Width="98%" CssClass="table table-bordered table-hover table-responsive" AllowPaging="True" EmptyDataText="لا يوجد مخيمات" PageSize="50"
                                                OnDataBound="gvExists_DataBound" OnRowCommand="gvExists_RowCommand" OnPageIndexChanging="gvExists_PageIndexChanging">
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
                                                            المخيم
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:HiddenField ID="hfCampStatus" runat="server" Value='<%# Bind("CampStatus")  %>' />
                                                            <asp:HiddenField ID="hfCampId" runat="server" Value='<%# Bind("CampId")  %>' />
                                                            <asp:HiddenField ID="hfCountryId" runat="server" Value='<%# Bind("CountryId")  %>' />
                                                            <asp:Label ID="lblCampDsecAr" runat="server" Text='<%# Bind("CampDsecAr")  %>'>  </asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            Camp
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCampDsecEn" runat="server" Text='<%# Bind("CampDsecEn")  %>'>  </asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            الدولة
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <%--                                                            <asp:Image ID="imgFlag" runat="server" ImageUrl='<%# Bind("TeamFlag")  %>' Height="36px" Width="51px" />--%>
                                                            <asp:Label ID="lblCountryDsecAr" runat="server" Text='<%# Bind("CountryDsecAr")  %>'>  </asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <i>تعديل</i>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbtnEdit" CssClass="btn btn-default" Text="تعديل" CausesValidation="false" runat="server" CommandName="cnEdit"> 
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Image ID="imgStatus" runat="server" Height="36px" Width="36px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <!--End Form Horizintal-->
                                </div>
                                <!--end row-->
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="panel-footer">
                    تسجيل المخيمات السنوية   مؤسسة البصر  العالمية
                       
                </div>
            </div>
        </div>

    </div>
</asp:Content>
