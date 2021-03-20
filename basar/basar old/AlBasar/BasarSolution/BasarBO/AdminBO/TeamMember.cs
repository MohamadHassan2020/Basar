using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class TeamMember : IDisposable
    {
        ~TeamMember() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public int TeamMemberId { get; set; }
        public int TeamMemberIdOut { get; set; }
        public short? TeamCategoryId { get; set; }
        public short? SpecializationId { get; set; }
        public short? TeamId { get; set; }
        public byte? NationalityId { get; set; }
        public byte? TeamClassId { get; set; }
        public string TeamMemberNameAr { get; set; }
        public string TeamMemberNameEn { get; set; }
        public string PassportNumber { get; set; }
        public string IssuerPlaceAr { get; set; }
        public string IssuerPlaceEn { get; set; }
        public DateTime DateOfBirth { get; set; }
        public DateTime DateOfIssue { get; set; }
        public DateTime ExpiryDate { get; set; }
        public string DateOfIssueStr { get; set; }
        public string ExpiryDateStr { get; set; }
        public string DateOfBirthStr { get; set; }
        public bool? TeamMemberStatus { get; set; }
        public string MsgOut { get; set; }
        public short AddBy { get; set; }
        public short UpdatedBy { get; set; }

    }
}
