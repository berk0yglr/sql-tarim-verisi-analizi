use tarim_verileri_punjab

select * from dbo.oil_seeds_punjab_agricultural_data


--1.Agregasyon--

select 
  o.Crop_Name
 ,o.Crop_Type
 ,SUM(Production_Tonnes) as Toplam_Uretim
 ,AVG(Yield_Kg_Per_Hectare) as ortalama

from dbo.oil_seeds_punjab_agricultural_data as o
group by  o.Crop_Name,o.Crop_Type
order by Toplam_Uretim desc


--2.Mevsimsel Trend Analizi--

select 
  Season
 ,AVG(Yield_Kg_Per_Hectare) as Ortalama
 ,SUM(Area_Hectares) as Toplam_Alan
from dbo.oil_seeds_punjab_agricultural_data
group by Season
order by Ortalama desc


--3.İhracat ve Pazar Analizi--


select
  o.Export_Status
 ,o.Crop_Name
 ,SUM(Production_Tonnes) as Toplam_Ihrac

from dbo.oil_seeds_punjab_agricultural_data as o
where Export_Status = 'Exported'
group by o.Export_Status,o.Crop_Name
order by Toplam_Ihrac DESC


--4.Veri Kategorizasyonu--


select 
 case 
  when Yield_Kg_Per_Hectare > 1500 then 'Yüksek Verim'
  when Yield_Kg_Per_Hectare > 1000 and Yield_Kg_Per_Hectare <=1500 then 'Orta Verim'
  when Yield_Kg_Per_Hectare <= 1000 then 'Düşük Verim'
  END AS Verimler
 ,COUNT(Yield_Kg_Per_Hectare) as Verim
from dbo.oil_seeds_punjab_agricultural_data
GROUP BY 
  case 
    WHEN Yield_Kg_Per_Hectare > 1500 THEN 'Yüksek Verim'
    WHEN Yield_Kg_Per_Hectare > 1000 AND Yield_Kg_Per_Hectare <= 1500 THEN 'Orta Verim'
    WHEN Yield_Kg_Per_Hectare <= 1000 THEN 'Düşük Verim'
  END;

--5.Kategori Bazlı Bölgesel Üretim Performansı ve Sıralaması--

select
   District_Name
  ,Crop_Type
  ,Crop_Name
  ,Production_Tonnes
  ,RANK()  OVER(PARTITION BY Crop_Type Order by Production_Tonnes desc) as Siralama 
from dbo.oil_seeds_punjab_agricultural_data