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
    class CartManager
    {
        private static CartManager instance;
        public CartManager Instance{
            get{
                if(instance == null)
                    instance = new CartManager();
                return instance;
            }
        }

        private CartManager(){}

        public List<Cart> GetAllCard(){
            return CartDAO.All();
        }

        public Cart GetCartsByProductID(string productID){
            return CartDAO.FindByProductID(productID);
        }

        public Exception AddToCart(string productID,string description){
            if(CartDAO.FindByProductID(productID) == null)
                return CartDAO.Insert(productID,1,description) ? null : new Exception("Have something wrong!");
            return CartDAO.UpdateQuantity(productID) ? null : new Exception("Have something wrong!");
        }

        public Exception RemoveFromCart(string productID){
            return CartDAO.Remove(productID) ? null : new Exception("Have something wrong!");
        }

        public Exception RemoveAllCart(){
            return CartDAO.Delete() ? null : new Exception("Have something wrong!");
        }

        public void Payment(List<Cart> carts){
            foreach (Cart item in carts)
            {
                Payment(item);
            }
        }

        public Exception Payment(Cart cart){
            return new Exception();
        }
    }
}
