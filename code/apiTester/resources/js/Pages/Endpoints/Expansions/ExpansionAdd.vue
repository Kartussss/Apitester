<script >
import axios from 'axios';

// Import Bootstrap and BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

export default {
  data() {
    return {
      form: {
        lang: 'en',
        original: '',
        replacement: '',
        action: 'add',
        apiKey: 'zzspk_Michal_mikCkwqSdSs4X9TpnYqeowmSFwPPdCS'
      },
      addResponse: 'none',
      addResponseCode: 'null',
      addResponseColor: ' #f2f2f2',
    }
  },
  props: {
      sectionColor: String,
  },
  methods: {
    async submitExpansionAdd(e) {
        axios.post('http://localhost:3149/expansion/', this.form, {
            headers: {
                // remove headers
            }
        }).then(res => {
            console.log(res);
            this.addResponseColor = '#c1f0c1'
            this.addResponseCode = res.status
            this.addResponse = res.message
        }).catch(err => {
            this.addResponseColor = '#ffad99'
            this.addResponseCode = err.status
            this.addResponse = err.message
            console.log('hi', err.status);
        })
       // .then((result)=>{console.warn(result)})
        e.preventDefault();
      //this.$emit('submit', this.form)
    },
  }
}
</script>

<template>
 <header :class="sectionColor+' w3-container'"> <H2>Expansion ADD</H2></header>
     <div class="form-row addExpansion">
     <div class="col-6">
        <form @submit="submitExpansionAdd">
        <div class="form-row">
          <div class="col">
            <label for="expansionAddLang">Select language</label>
            <select class="form-control" id="expansionAddFromLang" v-model="form.lang">
                <option value="en">en</option>
                <option value="de">de</option>
                <option value="cs">cs</option>
            </select>
          </div>
           <div class="col">
                  <div class="form-group">
                      <label for="expansionAddText">Insert original text</label>
                      <textarea class="form-control" v-model="form.original" />
                  </div>
        </div>

        </div>

        <div class="form-group">
            <label for="expansionAddTranslation">Insert replacement</label>
            <textarea class="form-control" v-model="form.replacement" />
        </div>
        <div class="form-group">
            <button class="btn btn-primary" type="submit">Submit</button>
        </div>

      </form>
     </div>
     <div class="col-6">
         <div class="card" >
              <div class="card-body">
                  <h5 class="card-title">Return Code</h5>
                  <h6 class="card-subtitle mb-2 text-muted">{{ addResponseCode}}</h6>

                  <h5 class="card-title">Return value</h5>
                   <h6 class="card-subtitle mb-2 text-muted">{{ addResponse }}</h6>

              </div>
        </div>
     </div>

     </div>
</template>

<style scoped>
    button {
        align-self: self-end;
        display: block;
        margin-left: auto;
    }
    header {
        margin-bottom: 10px;
        border-radius: 15px;
        background: #73AD21;
        padding: 0px 15px 0px;
        margin: 10px 0px 10px;
    }
    .addExpansion .card
    {
        position: absolute;
        left: 10%;
        min-width: 20rem;
        min-height: 10rem;
        background: v-bind(addResponseColor);
    }

</style>
