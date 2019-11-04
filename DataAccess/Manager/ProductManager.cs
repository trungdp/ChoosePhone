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
    class ProductManager
    {
        private ProductManager instance;
        public ProductManager Instance
        {
            get
            {
                if (instance == null)
                    instance = new ProductManager();
                return instance;
            }
        }

        private ProductManager() { }

        public List<Product> GetAllProducts()
        {
            return ProductDAO.All();
        }

        public List<Product> SearchByKeyWord(string word, string page, out int pageCount)
        {
            return ProductDAO.Search(word, page, out pageCount);
        }

        public List<Product> GetAllProductsWithPaging(int page, out int pageCount)
        {
            return ProductDAO.Paging(page, GlobalConfiguration.PageSize, out pageCount);
        }

        public List<Product> GetAllProductsWithPaging(int page, int pageSize, out int pageCount)
        {
            return ProductDAO.Paging(page, pageSize, out pageCount);
        }

        public bool AddProduct(Product data)
        {
            return ProductDAO.Insert(data) > 0;
        }
        public bool Update(Product data)
        {
            return ProductDAO.Update(data);
        }
        public bool DeleteProduct(string ProductID)
        {
            return ProductDAO.Delete(ProductID);

        }
    }
}
