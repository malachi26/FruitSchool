using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FruitSchool.Models;

namespace FruitSchool.Logic
{
    public class ShoppingCart : IDisposable
    {
        public string shoppingCartID { get; set; }
        public const string CartSessionKey = "CartID";
        private FruitSchoolContext _db = new FruitSchoolContext();

        public void AddToCart (int id)
        {
            shoppingCartID = GetCartId();

            //var cartItem = _db.CartItems.SingleOrDefault(c => c.CartID == shoppingCartID && c.FruitID == id);
            //if (cartItem == null)
            //{
                var cartItem = new CartItem
                {
                    CartItemID = Guid.NewGuid().ToString(),
                    FruitID = id,
                    CartID = shoppingCartID,
                    //fruit = _db.Fruits.SingleOrDefault(f => f.FruitID == id),
                    //Quantity = 1,
                    DateCreated = DateTime.UtcNow
                };
                _db.CartItems.Add(cartItem);
            //}
            //else
            //{
            //    cartItem.quantity++;
            //}
            _db.SaveChanges();
        }

        public void Dispose()
        {
            if (_db != null)
            {
                _db.Dispose();
                _db = null;
            }
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
                    Cart newCart = new Cart
                    {
                        CartID = tempCartID.ToString(),
                        DateCreated = DateTime.UtcNow
                    };
                    _db.Cart.Add(newCart);
                }
            }
            return HttpContext.Current.Session[CartSessionKey].ToString();
        }
        public List<CartItem> GetCartItems()
        {
            return _db.CartItems.Where(c => c.CartID == GetCartId()).ToList();
        }
    }
}