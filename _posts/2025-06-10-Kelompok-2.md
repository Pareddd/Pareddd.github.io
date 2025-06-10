---
title: "Fractional Knapsack Problem"
date: 2025-06-10 00:00:00 +0800
categories: [desain dan analisis algoritma, Fractional Knapsack]
tags: [belajar]
description: Penjelasan lengkap tentang Fractional Knapsack Problem dan solusinya dengan algoritma greedy
---

# Fractional Knapsack: Solusi Efisien dengan Algoritma Greedy

## 📌 Pendahuluan  
Fractional Knapsack adalah salah satu bentuk *Knapsack Problem*, sebuah permasalahan optimasi yang umum dalam algoritma. Tujuannya adalah memaksimalkan nilai barang yang dimasukkan ke dalam tas tanpa melebihi kapasitasnya. Berbeda dengan 0/1 Knapsack, dalam Fractional Knapsack kita *boleh mengambil sebagian barang*.

Contoh Aplikasi Dunia Nyata:
✔ Investasi dana ke proyek-proyek  
✔ Alokasi bandwidth dalam jaringan  
✔ Pengiriman logistik efisien  
✔ Penjadwalan tugas dengan sumber daya terbatas  

---

## 🎯 Definisi Masalah  
Diberikan:  
- n buah barang, masing-masing memiliki:  
  - Berat (`weight`)  
  - Nilai (`value`)  
- Kapasitas tas terbatas  

Tujuan:  
➡ Memasukkan barang (seluruh atau sebagian) ke dalam tas agar total nilai maksimal tanpa melebihi kapasitas.

---

## ⚡ Solusi dengan Algoritma Greedy  
Strategi optimal:  
1. Hitung rasio nilai per berat (value/weight) untuk tiap barang.  
2. Urutkan barang berdasarkan rasio tersebut secara menurun.  
3. Ambil sebanyak mungkin dari barang dengan rasio tertinggi hingga kapasitas tas penuh.  
4. Jika tidak muat sepenuhnya, ambil fraksi dari barang terakhir.

### 📝 Pseudocode  
```plaintext
1. Hitung value/weight untuk setiap item
2. Urutkan item berdasarkan rasio value/weight (descending)
3. Inisialisasi total_value = 0
4. Untuk setiap item:
   - Jika berat item <= kapasitas tas:
     - Tambahkan seluruh nilai item ke total_value
     - Kurangi kapasitas tas
   - Jika tidak:
     - Ambil fraksi yang bisa dimasukkan
     - Tambahkan nilai fraksinya ke total_value
     - Tas sudah penuh
     - Break
````

---

## **💻 Implementasi C++**

```cpp
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

struct Item {
    int value, weight;
};

bool cmpRatio(Item a, Item b) {
    double r1 = (double)a.value / a.weight;
    double r2 = (double)b.value / b.weight;
    return r1 > r2;
}

double fractionalKnapsack(int capacity, vector<Item> items) {
    sort(items.begin(), items.end(), cmpRatio);

    double totalValue = 0.0;

    for (const auto &item : items) {
        if (capacity >= item.weight) {
            capacity -= item.weight;
            totalValue += item.value;
        } else {
            totalValue += item.value * ((double)capacity / item.weight);
            break;
        }
    }

    return totalValue;
}

int main() {
    vector<Item> items = {
        {60, 10},
        {100, 20},
        {120, 30}
    };
    int capacity = 50;

    cout << "🧮 Nilai maksimum yang dapat diperoleh: "
         << fractionalKnapsack(capacity, items) << endl;

    return 0;
}
```

### 📊 Output Program

```
🧮 Nilai maksimum yang dapat diperoleh: 240
```

---

## 🔍 Analisis Kompleksitas

| Kriteria       | Kompleksitas |
| -------------- | ------------ |
| Sorting        | O(n log n)   |
| Seleksi Barang | O(n)         |
| Total          | O(n log n)   |

---

## 📌 Kesimpulan

✅ Fractional Knapsack dapat diselesaikan efisien dengan pendekatan greedy
✅ Barang dapat diambil sebagian sehingga solusi optimal lokal menghasilkan solusi global
✅ Kompleksitas waktu rendah dan mudah diimplementasikan

---
