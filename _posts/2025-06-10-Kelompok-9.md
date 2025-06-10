---
title: "Kahn's Algorithm (Topological Sort)"
date: 2025-06-10 00:00:00 +0800
categories: [desain dan analisis algoritma, graph traversal]
tags: [belajar]
description: Penjelasan dan implementasi algoritma topological sort menggunakan Kahn's Algorithm
---

# Kahn's Algorithm: Solusi Optimal untuk Topological Sorting pada DAG

## 📌 Pendahuluan
Kahn's Algorithm adalah algoritma penyusunan topologi (topological sorting) yang digunakan untuk menentukan urutan valid dalam Directed Acyclic Graph (DAG) berdasarkan ketergantungan antar simpul.

Contoh Aplikasi Dunia Nyata:
✔ Penjadwalan mata kuliah dengan prasyarat  
✔ Manajemen tugas proyek dengan dependensi  
✔ Sistem build yang mengkompilasi modul dependen  

---

## 🎯 Definisi Masalah
Diberikan:
- Graf berarah asiklik (DAG) dengan:
  - Simpul (vertices) merepresentasikan entitas
  - Sisi (edges) merepresentasikan ketergantungan

Tujuan:
➡ Menemukan urutan linier simpul dimana untuk setiap sisi u → v, u selalu muncul sebelum v

---

## ⚡ Solusi dengan Kahn's Algorithm
Strategi optimal:
1. Hitung in-degree (jumlah sisi masuk) tiap simpul
2. Masukkan simpul dengan in-degree 0 ke antrian
3. Proses antrian dan kurangi in-degree tetangga
4. Jika in-degree tetangga menjadi 0, tambahkan ke antrian
5. Ulangi hingga semua simpul diproses

### 📝 Pseudocode
```plaintext
1. Hitung in-degree untuk semua simpul
2. Buat antrian untuk simpul dengan in-degree 0
3. Selama antrian tidak kosong:
   - Keluarkan simpul u dari antrian
   - Masukkan u ke hasil topological sort
   - Untuk setiap tetangga v dari u:
     - Kurangi in-degree v
     - Jika in-degree v = 0, masukkan v ke antrian
4. Jika hasil tidak mengandung semua simpul, graf memiliki siklus
```

---

## **💻 Implementasi C++**
```cpp
#include <iostream>
#include <vector>
#include <queue>
#include <unordered_map>
using namespace std;

vector<char> topologicalSort(unordered_map<char, vector<char>>& graph) {
    unordered_map<char, int> inDegree;
    queue<char> q;
    vector<char> result;
    
    // Hitung in-degree
    for (auto& [u, neighbors] : graph) {
        for (char v : neighbors) {
            inDegree[v]++;
        }
    }
    
    // Temukan simpul dengan in-degree 0
    for (auto& [u, neighbors] : graph) {
        if (inDegree[u] == 0) {
            q.push(u);
        }
    }
    
    // Proses antrian
    while (!q.empty()) {
        char u = q.front();
        q.pop();
        result.push_back(u);
        
        for (char v : graph[u]) {
            inDegree[v]--;
            if (inDegree[v] == 0) {
                q.push(v);
            }
        }
    }
    
    // Cek siklus
    if (result.size() != graph.size()) {
        cout << "Graf memiliki siklus!" << endl;
        return {};
    }
    
    return result;
}

int main() {
    // Contoh graf ketergantungan mata kuliah
    unordered_map<char, vector<char>> graph = {
        {'A', {'C'}},
        {'B', {'C'}},
        {'C', {'D'}},
        {'D', {}}
    };
    
    vector<char> sorted = topologicalSort(graph);
    
    cout << "🔢 Urutan Topologis yang Valid:\n";
    for (char c : sorted) {
        cout << c << " ";
    }
    cout << endl;
    
    return 0;
}
```

### 📊 Output Program
```
🔢 Urutan Topologis yang Valid:
A B C D
```

---

## 🔍 Analisis Kompleksitas
|      Kriteria     |   Kompleksitas   |  
|-------------------|------------------|  
| Hitung in-degree  | O(V + E)         |  
| Proses antrian    | O(V + E)         |  
| Total             | O(V + E)         |  

---

## 📌 Kelebihan dan Kekurangan
**Kelebihan:**
✅ Kompleksitas waktu O(V + E) yang sangat efisien  
✅ Dapat mendeteksi siklus dalam graf berarah  
✅ Cocok untuk masalah dependensi seperti penjadwalan  

**Kekurangan:**
❌ Hanya bekerja pada DAG (tidak bisa menangani graf siklik)  
❌ Bisa menghasilkan beberapa urutan valid yang berbeda  
❌ Memerlukan struktur data tambahan (in-degree map)  

---

## 📌 Kesimpulan
✅ Kahn's Algorithm merupakan metode efisien untuk topological sorting  
✅ Implementasi sederhana menggunakan queue dan hash map  
✅ Berguna untuk berbagai aplikasi manajemen dependensi  
✅ Kompleksitas waktu linear terhadap jumlah simpul dan sisi  

Dengan kompleksitas O(V + E), algoritma ini menjadi pilihan ideal untuk menyelesaikan masalah penyusunan topologi dalam graf asiklik berarah.