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
            axios.get(this.url, this.form, {
                headers: {
                    "Cache-Control": "no-cache",
                    "Content-Type": "application/x-www-form-urlencoded",
                    "Access-Control-Allow-Origin": "*",
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
                console.log('hi', err);
            })
            // .then((result)=>{console.warn(result)})
            e.preventDefault();
            //this.$emit('submit', this.form)
        },
    }
}
</script>

<template>
    <header :class="sectionColor+' w3-container'"> <H2>Translate text</H2></header>
    <div :class="'form-row '+ subsection" >
        <div class="col-6">
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
                </div>
                <div class="form-group">
                    <label :for="subsection+'Text'">Insert text</label>
                    <textarea :id="subsection+'Text'" class="form-control" v-model="form.text" />
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
    margin-bottom: 10px;
    border-radius: 15px;
    background: #73AD21;
    padding: 0px 15px 0px;
    margin: 10px 0px 10px;
}
.card
{
    position: absolute;
    left: 10%;
    min-width: 20rem;
    min-height: 10rem;
    background: v-bind(responseColor);
}
.form-group
{
    padding-top: 10px;
}

</style>

