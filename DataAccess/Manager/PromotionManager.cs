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
    class PromotionManager
    {
        private PromotionManager instance;
        public PromotionManager Instance
        {
            get
            {
                if (instance == null)
                    instance = new PromotionManager();
                return instance;
            }
        }

        private PromotionManager() { }

        public List<Promotion> GetAllPromotions()
        {
            return PromotionDAO.All();
        }

        public List<Promotion> SearchByKeyWord(string word, string page, out int pageCount)
        {
            return PromotionDAO.Search(word, page, out pageCount);
        }

        public List<Promotion> GetAllPromotionsWithPaging(int page, out int pageCount)
        {
            return PromotionDAO.Paging(page, GlobalConfiguration.PageSize, out pageCount);
        }

        public List<Promotion> GetAllPromotionsWithPaging(int page, int pageSize, out int pageCount)
        {
            return PromotionDAO.Paging(page, pageSize, out pageCount);
        }

        public bool AddPromotion(Promotion data)
        {
            return PromotionDAO.Insert(data) > 0;
        }
        public bool Update(Promotion data)
        {
            return PromotionDAO.Update(data);
        }
        public bool DeletePromotion(string PromotionID)
        {
            return PromotionDAO.Delete(PromotionID);
        }
    }
}
