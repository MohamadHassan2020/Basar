<%@ Page Title="" Language="C#" MasterPageFile="~/Master/WideAdmin.Master" AutoEventWireup="true" CodeBehind="frmCampMedicines.aspx.cs" Inherits="Basar.PreparationForm.frmCampMedicines" %>
<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

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
                        الأدوية والشحن الجمركي 
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
                                <asp:DropDownList ID="ddlTeam" runat="server" CssClass="form-control" DataTextField="TeamDsecAr" DataValueField="TeamId" AutoPostBack="true" OnSelectedIndexChanged="ddlTeam_SelectedIndexChanged"></asp:DropDownList>
                                <span class="input-group-btn">
                                    <a href="../AdminForm/frmTeam.aspx" target="popup"
                                        onclick="window.open('../AdminForm/frmTeam.aspx','popup','width=600,height=600,scrollbars=1,resizable=no'); return false;">
                                        <button class="btn btn-default" type="button">
                                            <i class="fa fa-save"></i>
                                        </button>
                                    </a>
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
                            <asp:GridView ID="gvMedicines" runat="server" AutoGenerateColumns="False" GridLines="Both" Width="100%" BorderStyle="Solid" CaptionAlign="Top" HorizontalAlign="Center" BorderColor="Black" BorderWidth="3px" CssClass="gridview_mh">
                                <AlternatingRowStyle BackColor="#DEDEDE" ForeColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Height="30px" />
                                <Columns>
                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                        <HeaderTemplate>
                                            <label for="MBCountLabel" class="label_red">م</label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="MBCountLabel" CssClass="control-label label_red" runat="server"
                                                Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ControlStyle-Width="90%" ItemStyle-Width="15%">
                                        <HeaderTemplate>
                                            الفئه
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%--                                                    <asp:Label ID="lblMedicinesCategoryNameAr" runat="server" Text='<%# Bind("MedicinesCategoryNameAr")  %>' CssClass="control-label">  </asp:Label>--%>
                                            <asp:Label ID="lblMedicinesCategoryNameEn" runat="server" Text='<%# Bind("MedicinesCategoryNameEn")  %>' CssClass="control-label">  </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ControlStyle-Width="90%" ItemStyle-Width="30%">
                                        <HeaderTemplate>
                                            الأدوية
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%--                                                    <asp:Label ID="lblMedicinesNameAr" runat="server" Text='<%# Bind("MedicinesNameAr")  %>' CssClass="control-label">  </asp:Label>--%>
                                            <asp:Label ID="lblMedicinesNameEn" runat="server" Text='<%# Bind("MedicinesNameEn")  %>' CssClass="control-label">  </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ControlStyle-Width="90%" ItemStyle-Width="8%" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                        <HeaderTemplate>
                                            العدد المطلوب
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblMedicinesRequiredNumber" runat="server" Text='<%# Bind("MedicinesRequiredNumber") %>' CssClass="control-label">  </asp:Label>
                                            <asp:Label ID="lblMedicinesId" runat="server" Text='<%# Bind("MedicinesId")  %>' CssClass="control-label" Visible="False">  </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ControlStyle-Width="90%" ItemStyle-Width="8%">
                                        <HeaderTemplate>
                                            العدد الحالي
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtMedicinesNumber" runat="server" placeholder="العدد الحالي" MaxLength="20" CssClass="control-label">  </asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ControlStyle-Width="90%" ItemStyle-Width="14%">
                                        <HeaderTemplate>
                                            تاريخ الانتهاء
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtExpiryDate" runat="server" placeholder="تاريخ الانتهاء" MaxLength="10" CssClass="form-control">  </asp:TextBox>
                                            <cc1:calendarextender runat="server" targetcontrolid="txtExpiryDate" id="txtExpiryDate_CalendarExtender" popupbuttonid="txtExpiryDate" format="yyyy-MM-dd"></cc1:calendarextender>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ControlStyle-Width="90%" ItemStyle-Width="15%">
                                        <HeaderTemplate>
                                            ملاحظات
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtMedicinesRemark" runat="server" placeholder="ملاحظات" MaxLength="200" CssClass="control-label" TextMode="SingleLine">  </asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ControlStyle-Width="5%">
                                        <HeaderTemplate>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <span class="input-group-btn btn-block">
                                                <asp:LinkButton class="btn btn-default" ID="lbtnSearch" runat="server" CommandName="cnEdit" CausesValidation="false">
                                                <i class="fa fa-edit"></i>
                                                </asp:LinkButton>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle BorderStyle="None" ForeColor="Red" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#DEDEDE" BorderWidth="3px" Height="30px" />
                                <RowStyle BorderStyle="None" ForeColor="Black" BackColor="White" BorderWidth="3px" Font-Bold="True" />
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
                    الأدوية والشحن الجمركي
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
