<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="frmTour.aspx.cs" Inherits="Basar.AdminForm.frmTour" %>

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
                    <h4>ادخال الجولات والتعديل عليها</h4>
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
                                        <label for="txtTourDsecAr" class="col-md-2 col-md-offset-1">الجولة</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtTourDsecAr" runat="server" MaxLength="50" placeholder="إسم الجولة" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvtxtTourDsecAr" runat="server" CssClass="col-md-5 text-danger" ErrorMessage="إسم الجولة" Display="Dynamic" SetFocusOnError="True" ToolTip=" إسم الجولة" Text="إسم الجولة" ControlToValidate="txtTourDsecAr"></asp:RequiredFieldValidator>

                                    </div>

                                    <div class="form-group">
                                        <label for="txtTourDsecEn" class="col-md-2 col-md-offset-1">Tour</label>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtTourDsecEn" runat="server" placeholder="Tour Name" MaxLength="50" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="ddlTeam" class="col-md-2 col-md-offset-1">الفريق</label>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlTeam" runat="server" CssClass="form-control" DataTextField="TeamDsecAr" DataValueField="TeamId"></asp:DropDownList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvddlTeam" runat="server" CssClass="col-md-5 text-danger" ErrorMessage="الفريق" Display="Dynamic" SetFocusOnError="True" InitialValue="-1" ToolTip=" فريق الجولة" Text="فريق الجولة" ControlToValidate="ddlTeam"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group">
                                        <label for="rblTourStatus" class="col-md-2 col-md-offset-1">الحالة</label>
                                        <div class="col-md-4">
                                            <asp:RadioButtonList ID="rblTourStatus" runat="server" CssClass="control-label" RepeatDirection="Horizontal" Style="width: 100%" RepeatColumns="2">
                                                <asp:ListItem Value="true" Text="نشط" class="text-success"></asp:ListItem>
                                                <asp:ListItem Value="false" class="text-danger" Text="غير نشط"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvrblTourStatus" runat="server" CssClass="col-md-5 text-danger" ErrorMessage="حالة الجولة" Display="Dynamic" SetFocusOnError="True" ToolTip=" حالة الجولة" Text="حالة الجولة نشط أو غير نشط" ControlToValidate="rblTourStatus"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-3 col-md-offset-1">
                                            <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Button ID="btnView" runat="server" Text="عرض الجوالات" CssClass="btn btn-primary" OnClick="btnView_Click" CausesValidation="false" />
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Button ID="btnNew" runat="server" Text="جديد" CssClass="btn btn-primary" OnClick="btnNew_Click" CausesValidation="false" />
                                        </div>
                                    </div>
                                   
                                    <div class="form-group">
                                        <div class="col-md-11 col-md-offset-1">
                                            <asp:GridView ID="gvExists" runat="server" AutoGenerateColumns="False" Width="98%" CssClass="table table-bordered table-hover table-responsive" AllowPaging="True" EmptyDataText="لا يوجد جوالات" PageSize="50"
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
                                                            الجولة
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:HiddenField ID="hfTourStatus" runat="server" Value='<%# Bind("TourStatus")  %>' />
                                                            <asp:HiddenField ID="hfTourId" runat="server" Value='<%# Bind("TourId")  %>' />
                                                            <asp:HiddenField ID="hfTeamId" runat="server" Value='<%# Bind("TeamId")  %>' />
                                                            <asp:Label ID="lblTourDsecAr" runat="server" Text='<%# Bind("TourDsecAr")  %>'>  </asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            Tour
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTourDsecEn" runat="server" Text='<%# Bind("TourDsecEn")  %>'>  </asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            الفريق
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                              <asp:Image ID="imgFlag" runat="server" ImageUrl='<%# Bind("TeamFlag")  %>' Height="36px" Width="51px" />
                                                            <asp:Label ID="lblTeamDsecAr" runat="server" Text='<%# Bind("TeamDsecAr")  %>'>  </asp:Label>
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
                    تسجيل الجولات السنوية   مؤسسة البصر  العالمية
                       
                </div>
            </div>
        </div>

    </div>
</asp:Content>
