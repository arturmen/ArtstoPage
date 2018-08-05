import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import ProductList from '@/components/ProductList'
import ClickConfirm from 'click-confirm'

Vue.component('clickConfirm', ClickConfirm)

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/hello',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/',
      name: 'ProductList',
      component: ProductList
    }
  ]
})
