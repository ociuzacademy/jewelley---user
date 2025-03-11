class UserUrl {
  // Base URL for the API server 
  static const String baseUrl="https://nkdz72g4-8001.inc1.devtunnels.ms";
  static const String userbaseUrl="$baseUrl/userapp";
  static const String empbaseUrl="$baseUrl/employeeapp";


  static const String user_login ="$userbaseUrl/login/";
  static const String user_register ="$userbaseUrl/register/";
  static const String gold ="$userbaseUrl/register/";
  static const String categories ="$userbaseUrl/user_category_list/";
  static const String single_category ="$userbaseUrl/products/";
  static const String book_product ="$userbaseUrl/book_products/";
  static const String user_profile="$userbaseUrl/view_user_profile/";
  static const String user_feedback="$userbaseUrl/submit_feedback/";
  static const String user_checkout="$userbaseUrl/payments/";
  static const String user_confirm_checkout="$userbaseUrl/checkout/";
  static const String cart_product="$userbaseUrl/cart_products/";
  static const String view_cart="$userbaseUrl/view_cart/";
  static const String cart_item_delete="$userbaseUrl/remove_cart_items/";

  // Employee login details 

  static const String emp_login="$empbaseUrl/login/";
  static const String emp_profile_view="$empbaseUrl/view_employee_profile/";

 
  
  
}
