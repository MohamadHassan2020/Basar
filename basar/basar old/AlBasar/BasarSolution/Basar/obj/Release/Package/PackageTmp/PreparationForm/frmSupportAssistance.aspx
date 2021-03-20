<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="frmSupportAssistance.aspx.cs" Inherits="Basar.PreparationForm.frmSupportAssistance " %>

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
                    الدعم والمسانده 
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
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

                                    <div class="input-group label_red">
                                        <label for="">التأشيرات</label>
                                    </div>
                                    <div class="input-group custom-search-form div_padding_label">
                                        <asp:DropDownList ID="ddlVisa" runat="server" CssClass="form-control" DataValueField="SupportAssistanceId" DataTextField="SupportAssistanceDsecAr"></asp:DropDownList>
                                        <span class="input-group-btn">
                                            <asp:LinkButton CssClass="btn btn-default" ID="LinkButton1" runat="server">
                                        <i class="fa fa-search"></i>
                                            </asp:LinkButton>
                                        </span>
                                    </div>
                                    <div class="input-group label_red">
                                        <label for="ddlAdvertisement">الدعاية والإعلان</label>
                                    </div>
                                    <div class="input-group custom-search-form div_padding_label">
                                        <asp:DropDownList ID="ddlAdvertisement" runat="server" CssClass="form-control" DataValueField="SupportAssistanceId" DataTextField="SupportAssistanceDsecAr"></asp:DropDownList>
                                        <span class="input-group-btn">
                                            <asp:LinkButton CssClass="btn btn-default" ID="LinkButton4" runat="server">
                                        <i class="fa fa-search"></i>
                                            </asp:LinkButton>
                                        </span>
                                    </div>
                                    <div class="input-group label_red">
                                        <label for="ddlAccommodation">السكن</label>
                                    </div>
                                    <div class="input-group custom-search-form div_padding_label">
                                        <asp:DropDownList ID="ddlAccommodation" runat="server" CssClass="form-control" DataValueField="SupportAssistanceId" DataTextField="SupportAssistanceDsecAr"></asp:DropDownList>
                                        <span class="input-group-btn">
                                            <asp:LinkButton CssClass="btn btn-default" ID="LinkButton6" runat="server">
                                        <i class="fa fa-search"></i>
                                            </asp:LinkButton>
                                        </span>
                                    </div>
                                    <div class="input-group label_red">
                                        <label for="rblPhysicain">تسجيل الأطباء </label>
                                    </div>
                                    <div class="input-group custom-search-form div_padding_label" style="width: 98%">
                                        <asp:RadioButtonList ID="rblPhysicain" runat="server" CssClass="control-label" RepeatColumns="3" RepeatDirection="Horizontal" Style="width: 98%">
                                            <asp:ListItem Text="نعم" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="لا" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="ملاحظات" Value="0"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txtPhysicainRemark" runat="server" CssClass="form-control" MaxLength="100" Style="width: 98%"></asp:TextBox>
                                    </div>

                                    <div class="input-group label_red">
                                        <label for="rblTranslators">المترجمين </label>
                                    </div>
                                    <div class="input-group custom-search-form  div_padding_label" style="width: 98%">
                                        <asp:RadioButtonList ID="rblTranslators" runat="server" CssClass="control-label" RepeatColumns="3" RepeatDirection="Horizontal" Style="width: 98%">
                                            <asp:ListItem Text="نعم" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="لا" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="ملاحظات" Value="0"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txtTranslatorsRemark" runat="server" CssClass="form-control" MaxLength="100" Style="width: 98%"></asp:TextBox>
                                    </div>

                                    <div class="input-group  div_padding">
                                        <span class="input-group-btn">
                                            <asp:Button ID="btnNew" runat="server" Text="جديد" CssClass="btn btn-primary" OnClick="btnNew_Click" CausesValidation="false" />
                                            <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn btn-primary" OnClick="btnSave_Click" />
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
                                        <label for="">التصاريح</label>
                                    </div>
                                    <div class="input-group custom-search-form div_padding_label">
                                        <asp:DropDownList ID="ddlPermit" runat="server" CssClass="form-control" DataValueField="SupportAssistanceId" DataTextField="SupportAssistanceDsecAr"></asp:DropDownList>
                                        <span class="input-group-btn">
                                            <asp:LinkButton CssClass="btn btn-default" ID="LinkButton2" runat="server">
                                        <i class="fa fa-search"></i>
                                            </asp:LinkButton>
                                        </span>
                                    </div>
                                    <div class="input-group label_red">
                                        <label for="">التخليص الجمركي للأدوية والمعدات</label>
                                    </div>
                                    <div class="input-group custom-search-form div_padding_label">
                                        <asp:DropDownList ID="ddlCustomsClearance" runat="server" CssClass="form-control" DataValueField="SupportAssistanceId" DataTextField="SupportAssistanceDsecAr"></asp:DropDownList>
                                        <span class="input-group-btn">
                                            <asp:LinkButton CssClass="btn btn-default" ID="LinkButton3" runat="server">
                                        <i class="fa fa-search"></i>
                                            </asp:LinkButton>
                                        </span>
                                    </div>
                                    <div class="input-group label_red">
                                        <label for="">المواصلات</label>
                                    </div>
                                    <div class="input-group custom-search-form div_padding_label">
                                        <asp:DropDownList ID="ddlTransportation" runat="server" CssClass="form-control" DataValueField="SupportAssistanceId" DataTextField="SupportAssistanceDsecAr"></asp:DropDownList>
                                        <span class="input-group-btn">
                                            <asp:LinkButton CssClass="btn btn-default" ID="LinkButton5" runat="server">
                                        <i class="fa fa-search"></i>
                                            </asp:LinkButton>
                                        </span>
                                    </div>
                                    <div class="input-group label_red">
                                        <label for="">المتطوعين </label>
                                    </div>
                                    <div class="input-group custom-search-form div_padding_label" style="width: 98%">
                                        <asp:RadioButtonList ID="rblVolunteers" runat="server" CssClass="control-label" RepeatColumns="3" RepeatDirection="Horizontal" Style="width: 98%">
                                            <asp:ListItem Text="نعم" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="لا" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="ملاحظات" Value="0"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txtVolunteersRemark" runat="server" CssClass="form-control" MaxLength="100" Style="width: 98%"></asp:TextBox>
                                    </div>
                                    <div class="input-group label_red">
                                        <label for="rblOrganizationalTeam">فريق التنظيم </label>
                                    </div>
                                    <div class="input-group custom-search-form div_padding_label" style="width: 98%">
                                        <asp:RadioButtonList ID="rblOrganizationalTeam" runat="server" CssClass="control-label" RepeatColumns="3" RepeatDirection="Horizontal" Style="width: 98%">
                                            <asp:ListItem Text="نعم" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="لا" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="ملاحظات" Value="0"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txtOrganizationalTeamRemark" runat="server" CssClass="form-control" MaxLength="100" Style="width: 98%"></asp:TextBox>
                                    </div>
                                </div>


                            </div>
                            <div class="col-lg-2">
                            </div>
                            
                            <div class="row">
                                <div class="col-md-12 table-responsive">
                                    <asp:GridView ID="gvEquipment" runat="server" AutoGenerateColumns="False"  CssClass="table table-bordered table-hover">
                                        
                                        <Columns>
                                            <asp:TemplateField >
                                                <HeaderTemplate>
                                                    <label for="MBCountLabel" class="label_red">م</label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="MBCountLabel" CssClass="control-label label_red" runat="server"
                                                        Text="<%#Container.DataItemIndex+1 %>"></asp:Label>
                                                </ItemTemplate>
                                                
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    الجهاز
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEquipmentDescEn" runat="server" Text='<%# Bind("EquipmentDescEn")  %>' CssClass="control-label">  </asp:Label>
                                                    <asp:Label ID="lblEquipmentDescEnAr" runat="server" Text='<%# Bind("EquipmentDescEnAr")  %>' CssClass="control-label">  </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField >
                                                <HeaderTemplate>
                                                    الحالة
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:RadioButtonList ID="rblCampEquipmentStatus" runat="server" CssClass="form-control" RepeatColumns="3" RepeatDirection="Horizontal" >
                                                        <asp:ListItem Text="جيده" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="غير جيده" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="ملاحظات" Value="0"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:TextBox ID="txtCampEquipmentMemo" runat="server"   placeholder="ملاحظات" CssClass="form-control td-txt-memo" MaxLength="200" ></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField >
                                                <HeaderTemplate>
                                                    العدد المطلوب
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRequiredNumber" runat="server" Text='<%# Bind("EquipmentRequiredNumber") %>' CssClass="control-label td-txt-number">  </asp:Label>
                                                    <asp:Label ID="lblEquipmentId" runat="server" Text='<%# Bind("EquipmentId")  %>' CssClass="control-label" Visible="False">  </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField >
                                                <HeaderTemplate>
                                                    العدد الحالي
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtAvailableNumber" runat="server" placeholder="العدد الحالي" MaxLength="6" TextMode="Number" CssClass="form-control td-txt-number">  </asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-sm-offset-3">
                                    <a id="aSave" class="btn btn-primary" runat="server" onserverclick="aSave_ServerClick" >
                                        <span class="fa fa-save"></span>
                                        حفظ
                                    </a>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="panel-footer">
                    الدعم والمسانده
                       
                </div>
            </div>
        </div>

    </div>
</asp:Content>
