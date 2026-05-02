<div align="center">

# 🍹 Drinks Menu App

**A beautifully crafted Flutter application for browsing and ordering drinks**

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Provider](https://img.shields.io/badge/State_Management-Provider-764ABC?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

</div>

---

## 📱 Screenshots

<table>
  <tr>
    <td align="center">
      <img src="assets/screenshots/splash.jpg" width="200" alt="Splash Screen"/>
      <br /><b>Splash Screen</b>
    </td>
    <td align="center">
      <img src="assets/screenshots/home_all_products.jpg" width="200" alt="Home – All Products"/>
      <br /><b>Home – All Products</b>
    </td>
    <td align="center">
      <img src="assets/screenshots/home_hot_drinks_filter.jpg" width="200" alt="Home – Hot Drinks Filter"/>
      <br /><b>Home – Hot Drinks Filter</b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="assets/screenshots/home_filter_with_search.jpg" width="200" alt="Home – Filter with Search"/>
      <br /><b>Home – Filter with Search</b>
    </td>
    <td align="center">
      <img src="assets/screenshots/product_details1.jpg" width="200" alt="Product Details 1"/>
      <br /><b>Product Details</b>
    </td>
    <td align="center">
      <img src="assets/screenshots/product_details2.jpg" width="200" alt="Product Details 2"/>
      <br /><b>Product Details – Size</b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="assets/screenshots/product_details3.jpg" width="200" alt="Product Details 3"/>
      <br /><b>Product Details – Swipe</b>
    </td>
    <td align="center">
      <img src="assets/screenshots/product_details4.jpg" width="200" alt="Product Details 4"/>
      <br /><b>Product Details – Add to Cart</b>
    </td>
    <td align="center">
      <img src="assets/screenshots/cart_empty_state.jpg" width="200" alt="Cart Empty State"/>
      <br /><b>Cart – Empty State</b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="assets/screenshots/cart.jpg" width="200" alt="Cart"/>
      <br /><b>Cart</b>
    </td>
    <td align="center">
      <img src="assets/screenshots/cart_checkout.jpg" width="200" alt="Cart Checkout"/>
      <br /><b>Cart – Checkout</b>
    </td>
    <td></td>
  </tr>
</table>

---

## ✨ Features

- 🏠 **Home Screen** — Browse the full drinks catalog with a clean, card-based layout
- 🔍 **Search & Filter** — Real-time search combined with category filters (All, Hot, Cold, …)
- 📖 **Product Details** — Swipeable drink gallery with animated background tint transitions
- 🛒 **Cart Management** — Add items, choose size & quantity, view order summary
- 💳 **Checkout Flow** — Smooth checkout screen with order total breakdown
- 📱 **Responsive Design** — Adapts to all screen sizes using a responsive extension system
- 🎨 **Design System** — Consistent tokens for colors, spacing, shadows, and typography

---

## 🏗️ Architecture & Project Structure

```
lib/
├── core/
│   ├── themes/
│   │   └── colors.dart          # AppColors – brand & semantic palette
│   └── utils/
│       ├── app_spacing.dart     # AppSpacing – 4-pt grid + radius tokens
│       ├── app_text_style.dart  # AppTextStyles – typography scale
│       ├── app_shadows.dart     # AppShadows – elevation presets
│       └── context_extensions.dart  # Responsive helpers via BuildContext
├── features/
│   ├── Home/
│   │   ├── Data/
│   │   │   └── item_model.dart  # ItemModel – static drinks catalog
│   │   └── Presentation/
│   │       └── views/
│   │           └── home_view.dart
│   ├── ItemDetails/
│   │   └── Presentation/
│   │       ├── provider/
│   │       │   └── size_and_qty_provider.dart
│   │       └── views/
│   │           ├── item_details_view.dart
│   │           ├── item_details_view_body.dart
│   │           └── widgets/
│   │               ├── drink.dart
│   │               ├── drinks_dots.dart
│   │               ├── info_panel.dart
│   │               └── top_bar.dart
│   └── Cart/
│       └── Presentation/
│           └── views/
│               └── cart_view.dart
└── main.dart
```

The app follows a **feature-first** folder structure with a clear separation between **Data**, **Domain**, and **Presentation** layers inside each feature.

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

<div align="center">
  Made with ❤️ and Flutter
</div>
