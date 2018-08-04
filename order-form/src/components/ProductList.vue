<!-- src/components/ProductList.vue -->
<template>
  <div>
    <table class="table table-hover product-table">
      <thead>
        <tr>
          <th>Miniaturka</th>
          <th>Nazwa</th>
          <th>Opis</th>
          <th>Kolor</th>
          <th>Cena</th>
          <th>Ilość</th>
          <th>Akcje</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in items" :key="item.id">
          <td><img class="product_miniature" src="../assets/example_miniature.png"></td>
          <td>{{item.name}}</td>
          <td>{{item.description}}</td>
          <td>{{item.color}}</td>
          <td>{{item.price}},-</td>
          <td>
            <input v-model="item.quantity" placeholder="wprowadź ilość">
          </td>
          <td><button @click="removeItem(index)">Usuń</button></td>
        </tr>
        <tr>
          <td><img class="product_miniature" src="../assets/example_miniature.png"></td>
          <td>
            <select v-model="selectedProductId">
              <option value="" disabled selected>Nazwa produktu</option>
              <option v-for="product in products" :key="product.id" :value="product.id">{{ product.name }}</option>
            </select>
          </td>
          <td></td>
          <!-- TODO update colors based on the selected product -->
            <select v-model="selectedColor">
              <option value="" disabled selected>Kolor</option>
              <option value="Zielony">Zielony</option>
              <option value="Czerwony">Czerwony</option>
              <option value="Niebieski">Niebieski</option>
            </select>
          <td></td>
          <td>
            <input v-model="selectedQuantity" placeholder="wprowadź ilość">
          </td>
          <td>
            <button @click="addItem(selectedProductId, selectedColor, selectedQuantity)">Dodaj</button>
          </td>
        </tr>
      </tbody>
    </table>
    <button @click="saveProductsAsJSON()">Zamów</button>
  </div>
</template>

<script>
export default {
  data () {
    return {
      items: [
        {
          productId: 'cc919e21-ae5b-5e1f-d023-c40ee669520c',
          name: 'Młynek Alto',
          description: 'Nowość w świecie młynków do pieprzu',
          color: 'Czerwony',
          allowedColors: ['Czerwony', 'Zielony'],
          quantity: 5,
          price: 15
        },
        {
          productId: 'bcd755a6-9a19-94e1-0a5d-426c0303454f',
          name: 'Młynek Retro',
          description: 'Nowość w świecie młynków do kawy',
          color: 'Zielony',
          allowedColors: ['Czerwony', 'Zielony'],
          quantity: 10,
          price: 43
        }
      ],
      products: [
        {
          id: 'cc919e21-ae5b-5e1f-d023-c40ee669520c',
          name: 'Młynek Alto',
          description: 'Nowość w świecie młynków do pieprzu',
          colors: ['Czerwony', 'Zielony'],
          price: 9
        },
        {
          id: 'bcd755a6-9a19-94e1-0a5d-426c0303454f',
          name: 'Młynek Retro',
          description: 'Nowość w świecie młynków do kawy',
          allowedColors: ['Czerwony', 'Zielony'],
          price: 99
        },
        {
          id: '727026b7-7f2f-c5a0-ace9-cc227e686b8e',
          name: 'Młynek Alto Porcellana',
          description: 'Nowość w świecie młynków do pieprzu, ale w porcelanie',
          allowedColors: ['Czerwony', 'Zielony'],
          price: 12
        }
      ],
      'selectedProductId': 'cc919e21-ae5b-5e1f-d023-c40ee669520c',
      'selectedColor': 'Zielony',
      'selectedQuantity': '1'
    }
  },

  methods: {
    removeItem: function (index) {
      this.items.splice(index, 1)
    },

    addItem: function (productId, color, quantity) {
      let baseProduct = this.products.find(x => x.id === productId)
      console.log('adding product ' + baseProduct.name + ' ' + color + ' ' + quantity)
      this.items.push(
        {
          productId: baseProduct.id,
          name: baseProduct.name,
          description: baseProduct.description,
          color: color,
          allowedColors: baseProduct.allowedColors,
          quantity: quantity,
          price: baseProduct.price
        }
      )
    },

    saveProductsAsJSON: function () {
      const data = JSON.stringify(this.items)
      window.localStorage.setItem('orderedItemsData', data)
      console.log(JSON.parse(window.localStorage.getItem('orderedItemsData')))
    }
  }
}
</script>

<style>
  .product_miniature {
    width: 33px
  }
</style>
