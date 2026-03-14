# 🌾 Tarım ve Rekolte Verileri Üzerine SQL Analizi

## 📌 Proje Hakkında
Projede, standart SQL sorgularının (SELECT, WHERE, GROUP BY) ötesine geçilerek, veriyi iş kararlarına dönüştürecek ileri seviye analiz teknikleri uygulanmıştır. Temel veri keşfinden başlayarak, koşullu kategorizasyon ve **Window Functions (Pencere Fonksiyonları)** gibi ileri düzey SQL yetenekleri sergilenmiştir.

## 🛠 Kullanılan Teknolojiler
* **Dil:** SQL
* **Platform:** SQL Server Management Studio (SSMS)
* **Kavramlar:** Aggregation (SUM, AVG, COUNT), Data Filtering, Conditional Logic (CASE WHEN), Window Functions (RANK, PARTITION BY).

## 📊 Analiz Görevleri ve İş İçgörüleri (Business Insights)

### 1. Temel Veri Keşfi ve Üretim Özeti
* **Amaç:** Her bir ürün için toplam üretim miktarını ve ortalama verimliliği hesaplamak.
* **İçgörü:** Veriler incelendiğinde en yüksek toplam üretim hacmine sahip ürünün açık ara "Cotton Seed" (Pamuk Tohumu) olduğu tespit edilmiştir.

### 2. Mevsimsel Trend Analizi
* **Amaç:** Hangi sezonda daha çok alana ekim yapıldığını ve hangi sezonun daha verimli olduğunu bulmak.
* **İçgörü:** Bahar (Spring) sezonunda en geniş alana (381.300 hektar) ekim yapılmasına rağmen, Yaz (Summer) sezonunda daha az alanda (379.000 hektar) en yüksek verimlilik seviyesine (2000 kg/hektar) ulaşılmıştır. Yaz dönemi verimlilik açısından en kârlı sezondur.

### 3. İhracat ve Pazar Analizi
* **Amaç:** Sadece ihraç edilen (`Exported`) ürünleri filtreleyip, ihracat şampiyonlarını belirlemek.
* **İçgörü:** Dış pazarda en büyük paya sahip ürünümüz pamuk tohumudur. Pazarlama ve lojistik bütçelerinin dış pazarda bu ürüne odaklanması yatırım getirisini (ROI) maksimize edecektir.

### 4. Verim Kategorizasyonu (CASE WHEN)
* **Amaç:** Tarlaları hektar başına düşen verim miktarlarına göre "Yüksek", "Orta" ve "Düşük" verim olarak üç segmente ayırmak.
* **Sonuç:** `CASE WHEN` yapısı `GROUP BY` içerisinde kullanılarak operasyon departmanının kalite kontrol süreçlerini hızlandıracak net bir 3 satırlık özet tablo elde edilmiştir.

### 5. Kategori Bazlı Bölgesel Sıralama (Window Functions)
* **Amaç:** Her bir ürün kategorisini (Oilseed, Pulse) kendi içinde gruplayarak bölgesel üretim şampiyonlarını belirlemek.
* **Metodoloji:** `RANK() OVER (PARTITION BY Crop_Type ORDER BY Production_Tonnes DESC)` yapısı kullanılmıştır.
* **İçgörü:** Genel toplamlara bakmak yerine her kategorinin kendi lider bölgesini görmek, bölgesel teşviklerin ve tarım yatırımlarının çok daha isabetli yapılmasını sağlar.

---

## 👨‍💻 Yazar
**Berkay**
* GitHub: [@berk0yglr](https://github.com/berk0yglr)
