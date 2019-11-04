using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core;
using DataAccess.DTO;
using DataAccess.DAO;
namespace DataAccess.Manager
{
    class MemberCustomerManager
    {
        private MemberCustomerManager instance;
        public MemberCustomerManager Instance
        {
            get
            {
                if (instance == null)
                    instance = new MemberCustomerManager();
                return instance;
            }
        }

        private MemberCustomerManager() { }

        public List<MemberCustomer> GetAllMemberCustomers()
        {
            return MemberCustomerDAO.All();
        }

        public List<MemberCustomer> SearchByKeyWord(string word, string page, out int pageCount)
        {
            return MemberCustomerDAO.Search(word, page, out pageCount);
        }

        public List<MemberCustomer> GetAllMemberCustomersWithPaging(int page, out int pageCount)
        {
            return MemberCustomerDAO.Paging(page, GlobalConfiguration.PageSize, out pageCount);
        }

        public List<MemberCustomer> GetAllMemberCustomersWithPaging(int page, int pageSize, out int pageCount)
        {
            return MemberCustomerDAO.Paging(page, pageSize, out pageCount);
        }

        public bool AddMemberCustomer(MemberCustomer data)
        {
            return MemberCustomerDAO.Insert(data) > 0;
        }
        public bool Update(MemberCustomer data)
        {
            return MemberCustomerDAO.Update(data);
        }
        public bool DeleteMemberCustomer(string MemberCustomerID)
        {
            return MemberCustomerDAO.Delete(MemberCustomerID);
        }
    }
}
