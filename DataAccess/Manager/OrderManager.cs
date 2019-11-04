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
    class OrderManager
    {
        private OrderManager instance;
        public OrderManager Instance
        {
            get
            {
                if (instance == null)
                    instance = new OrderManager();
                return instance;
            }
        }

        private OrderManager() { }

        public List<Order> GetAllOrders()
        {
            return OrderDAO.All();
        }

        public List<Order> SearchByKeyWord(string word, string page, out int pageCount)
        {
            return OrderDAO.Search(word, page, out pageCount);
        }

        public List<Order> GetAllOrdersWithPaging(int page, out int pageCount)
        {
            return OrderDAO.Paging(page, GlobalConfiguration.PageSize, out pageCount);
        }

        public List<Order> GetAllOrdersWithPaging(int page, int pageSize, out int pageCount)
        {
            return OrderDAO.Paging(page, pageSize, out pageCount);
        }

        public bool AddOrder(Order data)
        {
            return OrderDAO.Insert(data) > 0;
        }
        public bool Update(Order data)
        {
            return OrderDAO.Update(data);
        }
        public bool DeleteOrder(string OrderID)
        {
            return OrderDAO.Delete(OrderID);
        }
    }
}
