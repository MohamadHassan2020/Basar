using BasarBLL.Operation;
using BasarBLL.Operation.AdminOperation;
using BasarBLL.Operation.SharedOperation;
using BasarBO.AdminBO;
using BasarBO.PlanBO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basar.PreparationForm
{
    public partial class frmArchive : System.Web.UI.Page
    {
        public int? DocumentId { get; set; }
        class Document : IDisposable
        {
            ~Document() { }
            public int DocumentId { get; set; }
            public int DocumentIdOut { get; set; }
            public byte DocumentTypeId { get; set; }
            public byte YearId { get; set; }
            public string DocumentNumber { get; set; }
            public string DocumentNumberDaily { get; set; }
            public string DocumentSaveNumber { get; set; }
            public DateTime? DocumentDate { get; set; }
            public string DocumentAttachNumber { get; set; }
            public string DocumentPlace { get; set; }
            public string DocumentSubject { get; set; }
            public bool IsModifyed { get; set; }
            public bool IsActive { get; set; }
            public bool IsDeleted { get; set; }
            public short CreatedBy { get; set; }
            public short UpdatedBy { get; set; }
            public string DocumentNumberDailyOut { get; set; }
            public string MsgOut { get; set; }

            public void Dispose()
            {
                GC.SuppressFinalize(this);
            }
        }
        #region banner
        short getUserId()
        {
            using (LoginAuthentication loginAuthentication = Session["loginAuthentication"] as LoginAuthentication)
            {
                return loginAuthentication.UserId;
            }
        }
        void MsgBox(string msg)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                sharedOp.MyMessege(upMain, msg);
            }
        }

        void GetYears()
        {
            using (var civilsysOp = HelperOperation.GetInstance())
            {
                ddlYear.DataSource = civilsysOp.GetDataTable("spGetYears");
                ddlYear.DataBind();
            }
        }
        void GetDocumentTypes()
        {
            using (HelperOperation civilsysOp = HelperOperation.GetInstance())
            {
                ddlDocumentType.DataSource = civilsysOp.GetDataTable("spGetDocumentTypes");
                ddlDocumentType.DataBind();
            }
        }
        void GetDocuments()
        {
            using (HelperOperation civilsysOp = HelperOperation.GetInstance())
            {
                byte? documentTypeId = !string.IsNullOrEmpty(ddlDocumentType.SelectedValue) &&
                    !ddlDocumentType.SelectedValue.Equals("-1") ? documentTypeId=Convert.ToByte(ddlDocumentType.SelectedValue) : null;

                byte? yearId = !string.IsNullOrEmpty(ddlYear.SelectedValue) &&
                    !ddlYear.SelectedValue.Equals("-1") ? yearId = Convert.ToByte(ddlYear.SelectedValue) : null;

                string documentNumber = !string.IsNullOrEmpty(txtDocumentNumber.Text.Trim())
                   ?  txtDocumentNumber.Text.Trim() : null;

                string documentSaveNumber = !string.IsNullOrEmpty(txtDocumentSaveNumber.Text.Trim())
                  ? txtDocumentSaveNumber.Text.Trim() : null;

                string documentPlace = !string.IsNullOrEmpty(txtDocumentPlace.Text.Trim())
                  ? txtDocumentPlace.Text.Trim() : null;

                string documentSubject = !string.IsNullOrEmpty(txtDocumentSubject.Text.Trim())
                  ? txtDocumentSubject.Text.Trim() : null;

                DateTime? documentDate = !string.IsNullOrEmpty(txtDocumentDate.Text.Trim()) &&
                   !checkInvalidDate(txtDocumentDate.Text.Trim()) 
                   ? documentDate =convertToDate(txtDocumentDate.Text.Trim()): null;
                
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@DocumentTypeId", documentTypeId),
                     new SqlParameter("@YearId", yearId),
                      new SqlParameter("@DocumentNumber", documentNumber),
                       new SqlParameter("@DocumentSaveNumber", documentSaveNumber),
                        new SqlParameter("@DocumentPlace", documentPlace),
                        new SqlParameter("@DocumentSubject", documentSubject),
                         new SqlParameter("@DocumentDate", documentDate),
                        

                };
                gvDocuments.DataSource = civilsysOp.GetDataTable("spGetDocuments", sqlparm);
                gvDocuments.DataBind();
            }
        }

        void GetDocumentAttachment(int? id)
        {
            using (HelperOperation civilsysOp = HelperOperation.GetInstance())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@DocumentId", id)
                };
                gvDocumentAttchment.DataSource = civilsysOp.GetDataTable("spGetDocumentAttachmentById", sqlparm);
                gvDocumentAttchment.DataBind();
            }
        }

        // return false when convert complete
        bool checkInvalidDate(string strValue)
        {
            try
            {
                convertToDate(strValue);
                return false;
            }
            catch (Exception)
            {

                return true;
            }
        }
        DateTime convertToDate(string strValue)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                return sharedOp.GetDateByFormat(strValue, "yyyy-MM-dd");
            }
        }
        void GetDocumentById(int id)
        {
            using (var helperOperation = HelperOperation.GetInstance())
            {
                List<SqlParameter> sqlParameters = new List<SqlParameter>()
                {
                    new SqlParameter ("@DocumentId",id)
                };
                SqlDataReader sqlDataReader = helperOperation.GetDataReader("spGetDocumentById", sqlParameters);

                while (sqlDataReader.Read())
                {
                    ViewState["DocumentId"] = sqlDataReader["DocumentId"].ToString();
                    txtDocumentAttachNumber.Text = sqlDataReader["DocumentAttachNumber"].ToString();
                    txtDocumentDate.Text = sqlDataReader["DocumentDateFormat"].ToString();
                    txtDocumentNumber.Text = sqlDataReader["DocumentNumber"].ToString();
                    txtDocumentPlace.Text = sqlDataReader["DocumentPlace"].ToString();
                    txtDocumentSaveNumber.Text = sqlDataReader["DocumentSaveNumber"].ToString();
                    txtDocumentSubject.Text = sqlDataReader["DocumentSubject"].ToString();
                    ddlDocumentType.SelectedValue = sqlDataReader["DocumentTypeId"] != DBNull.Value
                                ? ddlDocumentType.SelectedValue = sqlDataReader["DocumentTypeId"].ToString() : ddlDocumentType.SelectedValue = "-1";
                    ddlYear.SelectedValue = sqlDataReader["YearId"] != DBNull.Value
                                ? ddlYear.SelectedValue = sqlDataReader["YearId"].ToString() : ddlYear.SelectedValue = "-1";
                    lblDocumentNumberDailyOut.Text = sqlDataReader["DocumentNumberDaily"].ToString();
                    cbIsModifyed.Checked = sqlDataReader["IsModifyed"] != DBNull.Value
                                ? cbIsModifyed.Checked = Convert.ToBoolean(sqlDataReader["IsModifyed"].ToString()) : false;



                }
            }
        }
        void AddDocument()
        {

            if (ddlYear.SelectedValue.Equals(string.Empty) || ddlYear.SelectedValue.Equals("-1"))
            {
                MsgBox("العام");
            }
            else if (ddlDocumentType.SelectedValue.Equals(string.Empty) || ddlDocumentType.SelectedValue.Equals("-1"))
            {
                MsgBox("نوع المعاملة");
            }
            else
            {
                using (Document document = new Document())
                {
                    document.CreatedBy = getUserId();
                    document.DocumentAttachNumber = txtDocumentAttachNumber.Text.Trim();
                    if (!string.IsNullOrEmpty(ViewState["DocumentId"].ToString()))
                    {
                        document.DocumentId = Convert.ToInt32(ViewState["DocumentId"].ToString());
                    }
                    document.DocumentDate = !string.IsNullOrEmpty(txtDocumentDate.Text.Trim()) && !checkInvalidDate(txtDocumentDate.Text.Trim())
                        ? document.DocumentDate = convertToDate(txtDocumentDate.Text.Trim()) : null;
                    document.DocumentNumber = txtDocumentNumber.Text.Trim();
                    document.DocumentPlace = txtDocumentPlace.Text.Trim();
                    document.DocumentSaveNumber = txtDocumentSaveNumber.Text.Trim();
                    document.DocumentSubject = txtDocumentSubject.Text.Trim();
                    document.DocumentTypeId = Convert.ToByte(ddlDocumentType.SelectedValue);
                    document.IsActive = true;
                    document.IsModifyed = cbIsModifyed.Checked;
                    document.UpdatedBy = getUserId();
                    document.YearId = Convert.ToByte(ddlYear.SelectedValue);

                    List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@CreatedBy", document.CreatedBy),
                    new SqlParameter("@DocumentAttachNumber",document.DocumentAttachNumber),
                    new SqlParameter("@DocumentDate",document.DocumentDate),
                    new SqlParameter("@DocumentId",document.DocumentId),
                    new SqlParameter("@DocumentNumber", document.DocumentNumber),
                    new SqlParameter("@DocumentPlace", document.DocumentPlace),
                    new SqlParameter("@DocumentSaveNumber", document.DocumentSaveNumber),
                    new SqlParameter("@DocumentSubject", document.DocumentSubject),
                    new SqlParameter("@DocumentTypeId", document.DocumentTypeId),
                    new SqlParameter("@IsActive", document.IsActive),
                    new SqlParameter("@IsModifyed", document.IsModifyed),
                    new SqlParameter("@UpdatedBy", document.UpdatedBy),
                    new SqlParameter("@YearId", document.YearId)
                };
                    SqlParameter documentIdOut = new SqlParameter();
                    documentIdOut.ParameterName = "@DocumentIdOut";
                    documentIdOut.SqlDbType = SqlDbType.Int;
                    documentIdOut.Direction = ParameterDirection.Output;
                    sqlparm.Add(documentIdOut);
                    SqlParameter msgOut = new SqlParameter();
                    msgOut.ParameterName = "@MsgOut";
                    msgOut.SqlDbType = SqlDbType.NVarChar;
                    msgOut.Size = 100;
                    msgOut.Direction = ParameterDirection.Output;
                    sqlparm.Add(msgOut);
                    SqlParameter documentNumberDailyOut = new SqlParameter();
                    documentNumberDailyOut.ParameterName = "@DocumentNumberDailyOut";
                    documentNumberDailyOut.SqlDbType = SqlDbType.NVarChar;
                    documentNumberDailyOut.Size = 20;
                    documentNumberDailyOut.Direction = ParameterDirection.Output;
                    sqlparm.Add(documentNumberDailyOut);
                    using (var helperOperation = HelperOperation.GetInstance())
                    {
                        helperOperation.ChangeModifyed("spAddDocument", sqlparm);
                        ViewState["DocumentId"] = Convert.ToInt32(documentIdOut.Value);
                        if (!Convert.ToString(documentNumberDailyOut.Value).Equals(string.Empty))
                        {
                            lblDocumentNumberDailyOut.Text = Convert.ToString(documentNumberDailyOut.Value);
                        }
                        MsgBox(Convert.ToString(msgOut.Value));
                    };
                };
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["DocumentId"] = string.Empty;
                GetDocumentTypes();
                GetYears();
            }
        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            AddDocument();
            GetDocuments();
        }
        protected void lbtnSearch_Click(object sender, EventArgs e)
        {
            //GetBannerAttachment();
        }

        protected void lbtnClear_Click(object sender, EventArgs e)
        {
            ViewState["DocumentId"] = string.Empty;
            Response.Redirect(Request.Url.PathAndQuery, true);
        }

        protected void gvDocuments_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDocuments.PageIndex = e.NewPageIndex;
            GetDocuments();
        }

        protected void lbtnSearch_Click1(object sender, EventArgs e)
        {
            GetDocuments();
        }

        protected void gvDocumentAttchment_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            /*
            if (DocumentId!=null)
            {
                gvDocumentAttchment.PageIndex = e.NewPageIndex;
                GetDocumentAttachment(DocumentId);
            }
            */
        }

        protected void gvDocumentAttchment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cnOpenFile")
            {


                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                HiddenField hfMyFile = (HiddenField)row.FindControl("hfMyFile");
                Session["path"] = Server.MapPath(@"../Uploads\ArchiveFiles\") + hfMyFile.Value.Trim();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "onclick", "javascript:window.open('frmViewFile.aspx', '_blank', 'height=600px,width=600px,scrollbars=1'); ", true);


            }
        }


        protected void gvDocuments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "selectFiles")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                HiddenField hfDocumentId = (HiddenField)row.FindControl("hfDocumentId");
                if (hfDocumentId.Value.Equals(string.Empty))
                {

                }
                else
                {
                    int documentId = Convert.ToInt32(hfDocumentId.Value);
                    DocumentId = documentId;
                    GetDocumentAttachment(documentId);
                }
            }
            else if (e.CommandName == "cnEdit")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                HiddenField hfDocumentId = (HiddenField)row.FindControl("hfDocumentId");
                GetDocumentById(Convert.ToInt32(hfDocumentId.Value.Trim()));
            }

        }

        protected void gvDocuments_DataBound(object sender, EventArgs e)
        {

            foreach (GridViewRow grdRow in gvDocuments.Rows)
            {
                HiddenField hfDocumentFileName = (HiddenField)grdRow.FindControl("hfDocumentFileName");
                Image imgStatus = (Image)grdRow.FindControl("imgStatus");
                CheckExistDocument(hfDocumentFileName.Value, imgStatus, "../images/yes.png", "../images/nosm.png");

            }

        }

        public void CheckExistDocument(string value, System.Web.UI.WebControls.Image imgStatus, string imgTrue, string imgFalse)
        {
            if (value.Equals(string.Empty))
            {
                imgStatus.ImageUrl = imgFalse;
            }
            else
            {
                imgStatus.ImageUrl = imgTrue;
            }
        }

    }
}