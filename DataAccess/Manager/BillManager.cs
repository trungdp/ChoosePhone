using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core;
using DataAccess.DTO;
using DataAccess.DAO;
using DataAccess;
namespace DataAsccess.Manager
{
    public class BillManager
    {
        private static BillManager instance;
        public BillManager Instance{
            get{
                if(instance == null)
                    instance = new BillManager();
                return instance;
            }
        }

        private BillManager(){}

        public List<Bill> GetAllBills(){
            return BillDAO.All();
        }

        public List<Bill> SearchByKeyWord(string word, string page, out int pageCount){
            return BillDAO.Search(word, page,out pageCount);
        }

        public List<Bill> GetAllBillsWithPaging(string page, out int pageCount){
            return BillDAO.Paging(page,GlobalConfiguration.PageSize,out pageCount);
        }

        public List<Bill> GetAllBillsWithPaging(string page, int pageSize, out int pageCount){
            return BillDAO.Paging(page,pageSize,out pageCount);
        }

        public bool AddBill(Bill data){
            return BillDAO.Insert(data) > 0;
        }
        public bool Update(Bill data){
            return BillDAO.Update(data);
        }
        public bool DeleteBill(string billID){
            return BillDAO.Delete(billID);
        }

        public void ExportBills(){
            
        }
    }
}
