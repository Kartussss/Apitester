<script >
import axios from 'axios';

// Import Bootstrap and BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

export default {
  data() {
    return {
      form: {
        fromLang: 'en',
        toLang: 'de',
        text: '',
        translation: '',
        confidence: 1,
        action: 'add',
        apiKey: 'zzspk_Michal_mikCkwqSdSs4X9TpnYqeowmSFwPPdCS'
      },
      response: 'none',
      responseCode: 'null',
      responseColor: ' #f2f2f2',
    }
  },
  props: {
    sectionColor: String,
    subsection: String,
    url: String,
  },
  methods: {
    async submitForm(e) {
        axios.post( this.url , this.form, {
            headers: {
                // remove headers
            }
        }).then(res => {
            console.log(res);
            this.responseColor = '#c1f0c1'
            this.responseCode = res.status
            this.response = res.message
        }).catch(err => {
            this.responseColor = '#ffad99'
            this.responseCode = err.status
            this.response = err.message
            console.log('hi', err.status);
        })
        e.preventDefault();
    },
  }
}
</script>

<template>
    <header :class="sectionColor+' w3-container'"> <H2>Tramem ADD</H2></header>
     <div :class="subsection" >
         <div class="col-lg-5 col-4">
            <form @submit="submitForm">
                <div class="form-row">
                    <div class="col">
                        <label :for="subsection+'FromLang'">Select fromLanguage</label>
                        <select class="form-control" :id="subsection+'FromLang'" v-model="form.fromLang">
                            <option value="en">en</option>
                            <option value="de">de</option>
                            <option value="cs">cs</option>
                        </select>
                    </div>
                    <div class="col">
                        <label  :for="subsection+'ToLang'">Select toLanguage</label>
                        <select class="form-control" :id="subsection+'ToLang'" v-model="form.toLang">
                            <option value="en" >en</option>
                            <option value="de">de</option>
                            <option value="cs">cs</option>
                        </select>
                    </div>
                    <div class="col">
                        <label  :for="subsection+'Confidence'">Select confidence</label>
                        <select class="form-control" :id="subsection+'Confidence'" v-model="form.confidence">
                            <option value="1" >1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label :for="subsection+'Text'">Insert text</label>
                    <textarea :id="subsection+'Text'" class="form-control" v-model="form.text" />
                </div>
                <div class="form-group">
                    <label :for="subsection+'Translation'">Insert translation</label>
                    <textarea :id="subsection+'Translation'" class="form-control" v-model="form.translation" />
                </div>
                <div class="form-group">
                    <button class="btn btn-primary" type="submit">Submit</button>
                </div>
            </form>
         </div>
         <div id="responseWindow" class="col-lg-5 col-3 offset-1">
             <div class="card" >
                  <div class="card-body">
                      <h5 class="card-title">Return Code</h5>
                      <h6 class="card-subtitle mb-2 text-muted">{{ responseCode}}</h6>

                      <h5 class="card-title">Return value</h5>
                      <h6 class="card-subtitle mb-2 text-muted">{{ response }}</h6>
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
        border-radius: 15px;
        background: #73AD21;
        padding: 0 15px 0;
        margin: 10px 0 10px;
    }
    .card
    {
        position: relative;
        min-width: 15rem;
        min-height: 10rem;
        background: v-bind(responseColor);
    }
    .form-group
    {
        padding-top: 10px;
    }

</style>
