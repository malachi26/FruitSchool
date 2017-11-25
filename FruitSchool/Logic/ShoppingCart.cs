using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FruitSchool.Models;

namespace FruitSchool.Logic
{
    public class ShoppingCart
    {
        public string shoppingCartID { get; set; }
        public const string CartSessionKey = "CartID";
        private ProductContext _db = new ProductContext();

        public void AddToCart (int id)
        {
            shoppingCartID = GetCartId();
            var cartItem = _db.ShoppingCartItems.SingleOrDefault(c => c.cartId == shoppingCartID && c.fruitId == id);
            if (cartItem == null)
            {
                cartItem = new CartItem
                {
                    itemId = Guid.NewGuid().ToString(),
                    fruitId = id,
                    cartId = shoppingCartID,
                    fruit = _db.Fruits.SingleOrDefault(f => f.fruitID == id),
                    quantity = 1,
                    dateCreated = DateTime.UtcNow
                };
                _db.ShoppingCartItems.Add(cartItem);
            }
            else
            {
                cartItem.quantity++;
            }
            _db.SaveChanges();
        }
        public string GetCartId()
        {
            if (HttpContext.Current.Session[CartSessionKey] == null)
            { 
                if(!string.IsNullOrWhiteSpace(HttpContext.Current.User.Identity.Name))
                {
                    HttpContext.Current.Session[CartSessionKey] = HttpContext.Current.User.Identity.Name;
                }
                else
                {
                    Guid tempCartID = Guid.NewGuid();
                    HttpContext.Current.Session[CartSessionKey] = tempCartID.ToString();
                }
            }
            return HttpContext.Current.Session[CartSessionKey].ToString();
        }
    
    }
}