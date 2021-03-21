<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="frmTeamMembers.aspx.cs" Inherits="Basar.PreparationForm.frmTeamMembers " %>

<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row div_padding">
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-1">
        </div>
        <div class="col-lg-10">
            <div class="panel panel-primary div_shadow">
                <div class="panel-heading">
                    تسجيل أعضاء الفرق الطبية 
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="form-horizontal">
                                <hr />
                                <asp:ValidationSummary runat="server" CssClass="text-danger" />
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="ddlTeamClass" CssClass="col-md-2 control-label label_red">الوظيفة</asp:Label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlTeamClass" runat="server" CssClass="form-control" DataTextField="TeamClassDsecAr" DataValueField="TeamClassId" OnSelectedIndexChanged="ddlTeamClass_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    </div>

                                    <asp:Label runat="server" AssociatedControlID="ddlTeamCategory" CssClass="col-md-2 control-label label_red">الفئه</asp:Label>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddlTeamCategory" runat="server" DataTextField="TeamCategoryDsecAr" DataValueField="TeamCategoryId" CssClass="form-control">
                                            <asp:ListItem Value="-1">اختر الفئه</asp:ListItem>
                                        </asp:DropDownList>
                                        <%-- <span class="has-feedback">
                                            <a href="#" target="popup"
                                                onclick="window.open('#','popup','width=600,height=600,scrollbars=1,resizable=no'); return false;">
                                                <button class="btn btn-default" type="button">
                                                    <i class="fa fa-save"></i>
                                                </button>
                                            </a>
                                        </span>--%>
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlTeamClass" InitialValue="-1"
                                        CssClass="col-md-1 control-label label_red" ErrorMessage="الوظيفة" />
                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="txtTeamMemberNameAr" CssClass="col-md-2 control-label label_red">الإسم</asp:Label>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtTeamMemberNameAr" MaxLength="50" runat="server" CssClass="form-control" placeholder="الإسم"></asp:TextBox>
                                    </div>

                                    <asp:Label runat="server" AssociatedControlID="ddlNationality" CssClass="col-md-2 control-label label_red">الجنسية</asp:Label>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddlNationality" runat="server" DataTextField="NationalityAr" DataValueField="NationalityId" CssClass="form-control">
                                            <asp:ListItem Value="-1">الجنسية</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTeamMemberNameAr"
                                        CssClass="col-md-1 control-label label_red" ErrorMessage="الإسم" />
                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="ddlSpecialization" CssClass="col-md-2 control-label label_red">التخصص</asp:Label>
                                    <div class="col-md-4 has-feedback">

                                        <asp:DropDownList ID="ddlSpecialization" runat="server" DataTextField="SpecializationDsecAr" DataValueField="SpecializationId" CssClass="form-control">
                                            <asp:ListItem Value="-1">التخصص</asp:ListItem>
                                        </asp:DropDownList>
                                        <a href="#" target="popup" class="fa fa-edit form-control-feedback"
                                            onclick="window.open('#','popup','width=600,height=600,scrollbars=1,resizable=no'); return false;"></a>
                                    </div>
                                    <asp:Label runat="server" AssociatedControlID="txtDateOfBirth" CssClass="col-md-2 control-label label_red">تاريخ الميلاد</asp:Label>
                                    <div class="col-md-3 has-feedback">
                                        <asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="form-control" MaxLength="10" placeholder="تاريخ الميلاد"></asp:TextBox>
                                        <i class="fa fa-calendar form-control-feedback" id="stxtDateOfBirth"></i>
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDateOfBirth" CssClass="col-md-1 control-label label_red" ErrorMessage="تاريخ الميلاد" />
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="ddlTeam" CssClass="col-md-2 control-label label_red">الفريق</asp:Label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlTeam" runat="server" CssClass="form-control" DataTextField="TeamDsecAr" DataValueField="TeamId"></asp:DropDownList>
                                        <%-- <span class="input-group-btn">
                                            <a href="../AdminForm/frmTeam.aspx" target="popup"
                                                onclick="window.open('../AdminForm/frmTeam.aspx','popup','width=600,height=600,scrollbars=1,resizable=no'); return false;">
                                                <button class="btn btn-default" type="button">
                                                    <i class="fa fa-save"></i>
                                                </button>
                                            </a>
                                        </span>--%>
                                    </div>
                                    <asp:Label runat="server" AssociatedControlID="txtPassportNumber" CssClass="col-md-2 control-label label_red">رقم جواز السفر</asp:Label>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtPassportNumber" runat="server" CssClass="form-control" MaxLength="20" placeholder="رقم جواز السفر"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="rfvddlTeam" runat="server" CssClass="col-md-1 control-label label_red" ErrorMessage="الفريق" Display="Dynamic" SetFocusOnError="True" ToolTip=" الفريق" Text="*" ControlToValidate="ddlTeam"></asp:RequiredFieldValidator>

                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="txtDateOfIssue" CssClass="col-md-2 control-label label_red">تاريخ الاصدار</asp:Label>
                                    <div class="col-md-4 has-feedback">
                                        <asp:TextBox ID="txtDateOfIssue" runat="server" CssClass="form-control" placeholder="تاريخ الاصدار"></asp:TextBox>
                                        <i class="fa fa-calendar form-control-feedback" id="sDateOfIssue"></i>
                                    </div>
                                    <asp:Label runat="server" AssociatedControlID="txtExpiryDate" CssClass="col-md-2 control-label label_red">تاريخ الإنتهاء</asp:Label>
                                    <div class="col-md-3 has-feedback">
                                        <asp:TextBox ID="txtExpiryDate" runat="server" CssClass="form-control" placeholder="تاريخ الإنتهاء"></asp:TextBox>
                                        <i class="fa fa-calendar form-control-feedback" id="stxtExpiryDate"></i>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="txtIssuerPlaceAr" CssClass="col-md-2 control-label label_red">جهة الإصدار</asp:Label>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtIssuerPlaceAr" MaxLength="50" runat="server" CssClass="form-control" placeholder="جهة الإصدار"></asp:TextBox>
                                    </div>
                                    <asp:Label runat="server" AssociatedControlID="rblTeamMemberStatus" CssClass="col-md-2 control-label label_red">الحالة</asp:Label>
                                    <div class="col-md-3">
                                        <asp:RadioButtonList ID="rblTeamMemberStatus" runat="server" CssClass="control-label" RepeatDirection="Horizontal" Style="width: 100%" RepeatColumns="2">
                                            <asp:ListItem Value="true" Text="نشط"></asp:ListItem>
                                            <asp:ListItem Value="false" Text="غير نشط"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="rfvrblTeamMemberStatus" runat="server" CssClass="text-danger" ErrorMessage="حالة العضو" Display="Dynamic" SetFocusOnError="True" ToolTip=" حالة العضو" Text="*" ControlToValidate="rblTeamMemberStatus"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="fuDocuments" CssClass="col-md-2 control-label label_red">المرفقات</asp:Label>
                                    <div class="col-md-4">
                                        <asp:FileUpload ID="fuDocuments" runat="server" CssClass="form-control" placeholder="المرفقات"></asp:FileUpload>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-3">
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn btn-primary fa-save" OnClick="btnSave_Click" />
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Button ID="btnNew" runat="server" Text="جديد" CssClass="btn btn-danger" OnClick="btnNew_Click" CausesValidation="false" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:GridView ID="gvTeamMember" runat="server" AutoGenerateColumns="False" Width="98%" CssClass="table table-bordered table-hover" AllowPaging="True" OnPageIndexChanging="gvTeamMember_PageIndexChanging" OnRowCommand="gvTeamMember_RowCommand">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <label for="MBCountLabel" class="label_red">م</label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="MBCountLabel" CssClass="label_red" runat="server"
                                                        Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                                    <asp:Label ID="lblTeamMemberId" Visible="false" runat="server" Text='<%# Bind("TeamMemberId")  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTeamMemberNameAr" runat="server" Text='<%# Bind("TeamMemberNameAr")  %>'>   </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    الفئه
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTeamCategoryDsecAr" runat="server" Text='<%# Bind("TeamCategoryDsecAr")  %>'>   </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    الوظيفة
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTeamClassDsecAr" runat="server" Text='<%# Bind("TeamClassDsecAr")  %>'>   </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    التخصص
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSpecializationDsecAr" Text='<%# Bind("SpecializationDsecAr")  %>' runat="server" CssClass="control-label text-center" Style="width: 98%">   </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    الفريق
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTeamDsecAr" Text='<%# Bind("TeamDsecAr")  %>' runat="server">   </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <i class="fa fa-edit fa-2x text-danger"></i>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnSearch" CssClass="fa fa-edit fa-2x text-danger form-control-feedback" runat="server" CommandName="cnEdit" CausesValidation="false">
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerSettings PageButtonCount="5" />
                                    </asp:GridView>
                                </div>
                                <!--End from horizintal-->
                            </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="panel-footer">
                    تسجيل أعضاء الفرق الطبية
                       
                </div>
            </div>
        </div>

    </div>
</asp:Content>
