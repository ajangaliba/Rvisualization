## Grafik 1
x <- c("A", "B", "C")
y <- c(10, 15, 12)

barplot(y, names.arg = x, main = "Gruplara Gore Ortalama Puan",
        xlab = "Gruplar, eksen x", ylab = "Puan, eksan y", col = "skyblue")

# verinin yüklenmesi
veri <- read.csv("gelir_calisma.csv")

veri

head(veri) # veri setinin ilk 5 satırını göstermek için kullanılmıştır. yalnızca veri yazılarak çalıştırılsaydı, R tüm veri setini gösterebilirdi. Burada veri yapısını kısaca görmek amacıyla kullnaılmıştır head fonksiyonu.


#####    HİSTOGRAM

# Yaşların Dağılımı
hist(veri$yas,
     col = "lightblue",
     main = "Yaşların Dağılımı",
     xlab = "Yaş",
     ylab = "Kişi Sayısı")

#Gelirin Dağılımı? Bunu soru olarak sor
hist(veri$gelir,
     col = "lightgreen",
     main = "Gelirin Dağılımı",
     xlab = "Gelir",
     ylab = "Kişi Sayısı")





#####    BOXPLOT
# Gelir Dağılımı
boxplot(veri$gelir,
        main = "Gelir Dağılımı",
        ylab = "Gelir (TL)",
        col = "salmon")
median(veri$gelir)
min(veri$gelir)
max(veri$gelir)
summary(veri$gelir)

#Cinsiyete göre gelir dağılımı
boxplot(gelir ~ cinsiyet,
        data = veri,
        main = "Cinsiyete Gore Gelir Dagilimi",
        ylab = "Gelir (TL)",
        col = c("pink", "lightblue", "gray"))




##### BARPLOT
# Cinsiyete Göre Kişi Sayısı
table_cinsiyet <- table(veri_yas$cinsiyet)
barplot(table_cinsiyet,
        col = c("pink", "skyblue", "lightgray"),
        main = "Cinsiyete Göre Dağılım",
        xlab = "Cinsiyet",
        ylab = "Kişi Sayısı")

# Çalışma Durumuna Göre Kişi Sayısı
table_calisma <- table(veri$calisma_durumu)
barplot(table_calisma,
        col = c("lightgreen", "orange"),
        main = "Çalışma Durumuna Göre Dağılım",
        names.arg = c("Çalışmıyor", "Çalışıyor"),
        ylab = "Kişi Sayısı")





##### SCATTER PLOT
#
plot(veri$yas, veri$gelir,
main = "Yaş ve Gelir İlişkisi",
xlab = "Yaş",
ylab = "Gelir (TL)",
pch = 19,
col = "darkblue")


################# Çizgi Grafiği
# Yaşlara göre ortalama gelir hesapla
library(dplyr)
yas_gelir <- veri %>%
        group_by(yas) %>%
        summarise(ortalama_gelir = mean(gelir))

# Çizgi grafik oluştur
plot(yas_gelir$yas, yas_gelir$ortalama_gelir,
     type = "l",
     col = "darkgreen",
     main = "Yasa Gore Ortalama Gelir",
     xlab = "Yas",
     ylab = "Gelir (TL)")



################## Pasta Grafiği
cinsiyet_sayilari <- table(veri$cinsiyet)
pie(cinsiyet_sayilari,
    col = c("pink", "skyblue", "gray"),
    main = "Cinsiyetlerin Oransal Dağılımı")
