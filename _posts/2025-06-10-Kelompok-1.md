---
title: "Activity Selection Problem"
date: 2025-05-6 00:00:00 +0800
categories: [desain dan analisis algoritma, Activity Selection Problem]
tags: [belajar]     # TAG names should always be lowercase
description: What is Activity Selection Problem?
---

# Activity Selection Problem: Solusi Optimal dengan Algoritma Greedy

## 📌 Pendahuluan 
Activity Selection Problem adalah masalah klasik dalam ilmu komputer untuk memilih jumlah aktivitas maksimum yang tidak saling tumpang tindih dari sekumpulan aktivitas dengan waktu mulai dan selesai tertentu.  

Contoh Aplikasi Dunia Nyata:  
✔ Penjadwalan ruang meeting  
✔ Alokasi sumber daya CPU  
✔ Pengaturan jadwal pengiriman logistik  

---

## 🎯 Definisi Masalah  
Diberikan:  
- n aktivitas, masing-masing memiliki:  
  - Waktu mulai (`start`)  
  - Waktu selesai (`finish`)  
- Dua aktivitas kompatibel jika intervalnya tidak bertabrakan.  

Tujuan:  
➡ Memilih subset terbesar aktivitas yang saling kompatibel.  

---

## ⚡ Solusi dengan Algoritma Greedy  
Strategi optimal:  
1. Urutkan aktivitas berdasarkan waktu selesai (`finish`).  
2. Pilih aktivitas dengan `finish` tercepat.  
3. Iterasi: Pilih aktivitas berikutnya jika `start` ≥ `finish` aktivitas terakhir yang dipilih.  

### 📝 Pseudocode 
```plaintext
1. Sort activities by finish time (ascending)
2. Select first activity
3. For each next activity:
   - If start_time ≥ finish_time of last selected:
     - Select this activity
```

---

## **💻 Implementasi C++**  
```cpp
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

struct Activity {
    int id;     
    int start;  
    int finish; 
};

bool compareFinish(const Activity &a, const Activity &b) {
    return a.finish < b.finish;
}

vector<Activity> selectActivities(vector<Activity> activities) {
    vector<Activity> selected;
    
    sort(activities.begin(), activities.end(), compareFinish);
    
    selected.push_back(activities[0]);
    int last = 0;
    
    for (int i = 1; i < activities.size(); i++) {
        if (activities[i].start >= activities[last].finish) {
            selected.push_back(activities[i]);
            last = i;
        }
    }
    
    return selected;
}

int main() {
    
    vector<Activity> activities = {
        {1, 1, 4},  // A1
        {2, 3, 5},  // A2
        {3, 0, 6},  // A3
        {4, 5, 7},  // A4
        {5, 8, 9},  // A5
        {6, 5, 9}   // A6
    };
    
    vector<Activity> result = selectActivities(activities);
    
    cout << "🟢 Aktivitas yang Terpilih:\n";
    cout << "ID\tStart\tFinish\n";
    cout << "-----------------------\n";
    for (const auto &act : result) {
        cout << "A" << act.id << "\t" << act.start << "\t" << act.finish << endl;
    }
    
    return 0;
}
```

### 📊 Output Program  
```
🟢 Aktivitas yang Terpilih:
ID      Start   Finish
-----------------------
A1      1       4
A4      5       7
A5      8       9
```

---

## 🔍 Analisis Kompleksitas  
|      Kriteria     |   Kompleksitas   |  
|-------------------|------------------|  
| Sorting           | O(n log n)       |  
| Seleksi Aktivitas | O(n)             |  
| Total             | (n log n)        |  

---

## 📌 Kesimpulan  
✅ Algoritma Greedy memberikan solusi optimal dengan kompleksitas O(n log n).  
✅ Cocok untuk masalah penjadwalan tanpa banyak batasan tambahan.  
✅ Implementasi sederhana dengan C++ menggunakan sorting dan iterasi.   

---