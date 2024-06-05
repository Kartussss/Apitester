<script >
import axios from 'axios';

// Import Bootstrap and BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

export default {
  data() {
    return {
      form: {
        rule: '',
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
    async submitPredefinedTranslationAdd(e) {
        axios.post('http://localhost:3149/predefinedTranslation/', this.form, {
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
    <header :class="'w3-container '+ sectionColor"> <H2>PredefinedTranslation ADD</H2></header>
     <div class="form-row addPredefinedTranslation">
         <div class="col-6">
            <form @submit="submitPredefinedTranslationAdd">
                <div class="form-group">
                    <label for="predefinedTranslationAddRule">Insert rule</label>
                    <textarea id="predefinedTranslationAddRule" class="form-control" v-model="form.rule" />
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
    .addPredefinedTranslation .card
    {
        position: absolute;
        left: 10%;
        min-width: 20rem;
        min-height: 10rem;
        background: v-bind(addResponseColor);
    }
    form textarea {
        min-height: 15em;
    }

</style>
