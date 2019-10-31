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
    class AccountManager
    {
        private static AccountManager instance;
        public AccountManager Instance{
            get{
                if(instance == null)
                    instance = new AccountManager();
                return instance;
            }
        }

        private AccountManager(){}

        public List<Account> GetAllAccounts(){
            return AccountDAO.All();
        }

        public List<Account> SearchByKeyWord(string word, string page, out int pageCount){
            return AccountDAO.Search(word, page,out pageCount);
        }

        public List<Account> GetAllAccountsWithPaging(string page, out int pageCount){
            return AccountDAO.Paging(page,GlobalConfiguration.PageSize,out pageCount);
        }

        public List<Account> GetAllAccountsWithPaging(string page, int pageSize, out int pageCount){
            return AccountDAO.Paging(page,pageSize,out pageCount);
        }

        public bool AddAccount(Account data){
            return AccountDAO.Insert(data) > 0;
        }
        public bool Update(Account data){
            return AccountDAO.Update(data);
        }
        public bool DeleteAccount(string AccountID){
            return AccountDAO.Delete(AccountID);
        }

        public Exception Login(string name, string pass){
            foreach (Account acc in GetAllAccounts())
                if (acc.Username == name && acc.Password == pass)
                    return null;
            return new Exception("Not find account!");
        }

        public Exception Signup(string name, string pass){
            foreach (Account acc in GetAllAccounts())
                if (acc.Username == name)
                    return new Exception("This user name already exits!");
            AddAccount(new Account(){Username=name,Password=pass});
            return null;;
        }
        public Exception ChangePassword(string name, string pass, string confirm){
            foreach (Account acc in GetAllAccounts())
                if (acc.Username == name)
                    return new Exception("This user name already exits!");
            Update();
            return null;;
        }
    }
}
