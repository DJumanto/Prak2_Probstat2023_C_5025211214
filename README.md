# Praktikum Modul 2 Probstat

## No 1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap
kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel
sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat
kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut
diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat
kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9
responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan
aktivitas


| Responden |  X | Y | 
| --------- | -- | -- |
| 1 | 78 | 100 |
| 2 | 75 | 95
| 3 | 67 | 70
| 4 | 77 | 90
| 5 | 70 | 90
| 6 | 72 | 90
| 7 | 78 | 89
| 8 | 70 | 100
| 9 | 77 | 100

a. Carilah Standar deviasi dari data selisih pasangan pengamatan tabel diatas

```R
x <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 100, 100)

standarDev <- sd(y-x)
standarDev
```
Result:

```R
7.838651
```
b. Carilah nilai t (p-value)

```R
tRes <- t.test(y,x, paired=TRUE)
tRes
```
Result:

![image](https://github.com/DJumanto/Prak2_Probstat2023_C_5025211214/assets/100863813/a4090263-a18f-4f3c-bba1-7e0809116154)


c. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam
hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika
diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang
signifikan secara statistika dalam hal kadar saturasi oksigen sebelum dan sesudah
melakukan aktivitas 𝐴”.

Karena hasil dari **p-value** lebih kecil dari 𝛼 = 0.05, maka H0 ditolak, yang dimana berarti ada pengaruh secara statistika dalam kadar saturasi ooksigen sebelum dan sesudah melakukan aktivitas A.

## No 2
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 25.000 kilometer per
tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak
diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak
menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3.000 kilometer
(kerjakan menggunakan library seperti referensi pada modul).

a. Apakah Anda setuju dengan klaim tersebut? Jelaskan.

Tidak, karena kalim nilai 25.000 terlalu jauh dengan standard data rata-rata 23.500 dan standard deviasi 3000.


b. Buatlah kesimpulan berdasarkan p-value yang dihasilkan!

```R
library(BSDA)
tsum.test(mean.x = 23500, s.x = 3000, n.x = 100, mu = 25000)
```

Result:
![image](https://github.com/DJumanto/Prak2_Probstat2023_C_5025211214/assets/100863813/117a7723-345e-47c9-9cda-454519c303ab)


Jarak tempuh mobil per-tahun berada pada interval 22904.73 km dan 24095.27 km dengan interval kepercayaan sebesar 95%

Kesimpulan:

Dengan skir p-value kurang dari **α= 0.05** maka H0 dapat ditolak, sehingga kesimpulan yang didapat adalah mobil yang dikemudikan rata-rata kurang dari 25000 km per-tahun. 


## No 3
Diketahui perusahaan memiliki seorang data analyst yang ingin memecahkan
permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya
didapatkanlah data berikut dari perusahaan saham tersebut.
| Nama Kota/ Atribut | Bandung | Bali |
| ------------------ | ------- | ---- |
|Jumlah Saham | 20 | 27
Sampel Mean |	3.64 |	2.79
Sampel Standar Deviasi |	1.67 | 	1.5

Dari data di atas berilah keputusan serta kesimpulan yang didapatkan. Asumsikan
nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)?
Buatlah:


A. H0 dan H1

Jawab: 
- H0 => μ1 = μ2
- H1 => μ1 ≠ μ2

B. Hitung sampel statistik

Jawab: 

```R
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 20, mean.y =2.79 , s.y = 1.5 , n.y=27, alternative = "two.side", var.equal = TRUE)
```

Result:
![image](https://github.com/DJumanto/Prak2_Probstat2023_C_5025211214/assets/100863813/de4e72e7-1ce8-45ba-8aa1-0f9788edd61d)


C. Lakukan uji statistik (df =2)

Jawab:

```R
library(mosaic)
plotDist(dist = 't', df = 2, col ='red')
```

Result:
![image](https://github.com/DJumanto/Prak2_Probstat2023_C_5025211214/assets/100863813/ad444943-5135-4376-b8d5-c8fcb8f50962)


D. Nilai kritikal

Jawab:
```R
qchisq(p = 0.05, df = 2, lower.tail = FALSE)
```

Result:
```R
5.991465
```

E. Keputusan

nilai t ada pada rentang nilai kritikal sehingga H0 diterima.

F. Kesimpulan

Kesimpulan yang bisa diambil adalah H0 diterima karena tidak terdapat perbedaan rerata saham.

## No 4

Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk
mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca
pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan
dilakukan sebanyak 27 kali dan didapat data sebagai berikut:


a. Buatlah plot sederhana untuk visualisasi data.

Jawab:

```R
data <- read.csv("GTL.csv")

qplot(x = Temp, y = Light, geom = "point", data = data) + facet_grid(.~Glass, labeller = label_both)
```

Result:

![image](https://github.com/DJumanto/Prak2_Probstat2023_C_5025211214/assets/100863813/c5e2dda3-01f2-4dbb-88bb-50fb5156bd56)


b. Lakukan uji ANOVA dua arah.

Jawab:

```R
data$Glass <- as.factor(data$Glass)
data$Temp <- as.factor(data$Temp)

anova <- aov(Light~Glass*Temp, data=data)
summary(anova)
```

Result:
![image](https://github.com/DJumanto/Prak2_Probstat2023_C_5025211214/assets/100863813/c5e2dda3-01f2-4dbb-88bb-50fb5156bd56)


c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap
perlakuan (kombinasi kaca pelat muka dan suhu operasi).

Jawab:

```R
library(dplyr)
summary <- group_by(data, Glass, Temp) %>% summarise(mean = mean(Light), sd = sd(Light)) %>% arrange(desc(mean))
summary
```

Result:

![image](https://github.com/DJumanto/Prak2_Probstat2023_C_5025211214/assets/100863813/00416911-5dac-4eeb-a33b-6e5d58313c19)
