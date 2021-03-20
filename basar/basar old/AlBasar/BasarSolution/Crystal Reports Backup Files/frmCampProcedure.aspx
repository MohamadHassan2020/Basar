<%@ Page Title="" Language="C#" MasterPageFile="~/Master/WideAdmin.Master" AutoEventWireup="true" CodeBehind="frmCampProcedure.aspx.cs" Inherits="Basar.PreparationForm.frmCampProcedure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row div_padding">
    </div>
    <!-- /.row -->
    <div class="row">
        <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="panel panel-primary div_shadow">
                    <div class="panel-heading">
                        اجراءات الفريق 
               
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-2">
                        </div>
                        <div class="col-lg-4">
                            <div class="input-group label_red">
                                <label for="">العام</label>
                            </div>
                            <div class="input-group custom-search-form div_padding_label">
                                <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control" DataTextField="YearNameAr" DataValueField="YearId"></asp:DropDownList>
                                <span class="input-group-btn">
                                    <asp:LinkButton class="btn btn-default" ID="lbtnSearch" runat="server" CausesValidation="false">
                                                <i class="fa fa-search"></i>
                                    </asp:LinkButton>
                                </span>
                            </div>
                            <div class="input-group label_red">
                                <label for="">المخيم</label>
                            </div>
                            <div class="input-group custom-search-form div_padding_label">
                                <asp:DropDownList ID="ddlCamps" runat="server" DataTextField="CampDsecAr" DataValueField="CampId" CssClass="form-control">
                                    <asp:ListItem Value="-1">اختر المخيم</asp:ListItem>
                                </asp:DropDownList>
                                <span class="input-group-btn">
                                    <a href="../AdminForm/frmCamp.aspx" target="popup"
                                        onclick="window.open('../AdminForm/frmCamp.aspx','popup','width=600,height=600,scrollbars=1,resizable=no'); return false;">
                                        <button class="btn btn-default" type="button">
                                            <i class="fa fa-save"></i>
                                        </button>
                                    </a>
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="input-group label_red">
                                <label for="">الدولة</label>
                            </div>
                            <div class="input-group custom-search-form div_padding_label">
                                <asp:DropDownList ID="ddlCountries" runat="server" DataTextField="CountryDsecAr" DataValueField="CountryId" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged">
                                    <asp:ListItem Value="-1">الدولــة</asp:ListItem>
                                </asp:DropDownList>
                                <span class="input-group-btn">
                                    <a href="../AdminForm/frmCountry.aspx" target="popup"
                                        onclick="window.open('../AdminForm/frmCountry.aspx','popup','width=600,height=600,scrollbars=1,resizable=no'); return false;">
                                        <button class="btn btn-default" type="button">
                                            <i class="fa fa-save"></i>
                                        </button>
                                    </a>
                                </span>
                            </div>
                            <div class="input-group label_red">
                                <label for="ddlTeam">الفريق</label>
                            </div>
                            <div class="input-group custom-search-form div_padding_label">
                                <asp:DropDownList ID="ddlTeam" runat="server" CssClass="form-control" DataTextField="TeamDsecAr" DataValueField="TeamId" ></asp:DropDownList>
                                <span class="input-group-btn">
                                    <asp:LinkButton ID="lbtnFind" runat="server" CssClass="btn btn-primary"  OnClick="lbtnFind_Click"> بحث
                                         
                                    </asp:LinkButton>
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-2">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2">
                        </div>
                        <div class="col-lg-10 div_padding">
                            <asp:CheckBoxList ID="cblTeamMembers" runat="server" DataTextField="TeamMemberNameAr" DataValueField="TeamMemberId" RepeatColumns="3" RepeatDirection="Horizontal" Width="98%"></asp:CheckBoxList>
                        </div>
                        <div class="col-lg-2">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <asp:GridView ID="gvCampMembers" runat="server" AutoGenerateColumns="False" Width="98%"  CssClass="table table-bordered table-hover" OnDataBound="gvCampMembers_DataBound">
                                <Columns>
                                    <asp:TemplateField >
                                        <HeaderTemplate>
                                            <label for="MBCountLabel" class="label_red">م</label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="MBCountLabel" CssClass="label_red" runat="server"
                                                Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                    <asp:TemplateField >
                                        <HeaderTemplate>
                                                الاسم
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblTeamMemberNameAr" runat="server" Text='<%# Bind("TeamMemberNameAr")  %>'>   </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField >
                                        <HeaderTemplate>
                                            الفريق
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblTeamDsecAr" runat="server" Text='<%# Bind("TeamDsecAr")  %>' >   </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField >
                                        <HeaderTemplate>
                                            جواز السفر
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPassportNumber" runat="server" Text='<%# Bind("PassportNumber")  %>' >   </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField  >
                                        <HeaderTemplate>
                                            التأشيرات
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlVisa" runat="server"  DataTextField="ProcedureTypeDsecAr" DataValueField="ProcedureTypeId"></asp:DropDownList>
                                            <asp:TextBox ID="txtVisaRemark" runat="server"  MaxLength="100" placeholder="ملاحظات التأشيرات"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField  >
                                        <HeaderTemplate>
                                            التصاريح
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlPermits" runat="server"  DataTextField="ProcedureTypeDsecAr" DataValueField="ProcedureTypeId"></asp:DropDownList>
                                            <asp:TextBox ID="txtPermitsRemark" runat="server"  MaxLength="100" placeholder="ملاحظات التصاريح"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField  >
                                        <HeaderTemplate>
                                            التذاكر
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlTickets" runat="server"  DataTextField="ProcedureTypeDsecAr" DataValueField="ProcedureTypeId"></asp:DropDownList>
                                            <asp:TextBox ID="txtTicketsRemark" runat="server"  MaxLength="100" placeholder="ملاحظات التذاكر"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2">
                        </div>
                        <div class="col-lg-10">
                            <div class="input-group  div_padding">
                                <span class="input-group-btn">
                                    <asp:Button ID="btnNew" runat="server" Text="جديد" CssClass="btn btn-primary" />
                                    <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-2">
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    أعضاء المخيم
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
