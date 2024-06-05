<script >
import axios from 'axios';

// Import Bootstrap and BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

export default {
    data() {
        return {
            form: {
                lang: 'de',
                text: '',
                action: 'find',
                apiKey: 'zzspk_Michal_mikCkwqSdSs4X9TpnYqeowmSFwPPdCS'
            },
            findResponse: 'none',
            findResponseCode: 'null',
            findResponseColor: ' #f2f2f2',
        }
    },
    props: {
        sectionColor: String,
    },
    methods: {
        async submitExpansionFind(e) {
            axios.post('http://localhost:3149/expansion/', this.form, {
                headers: {
                    // remove headers
                }
            }).then(res => {
                console.log(res);
                this.findResponseColor = '#c1f0c1'
                this.findResponseCode = res.status
                this.findResponse = res.message
            }).catch(err => {
                this.findResponseColor = '#ffad99'
                this.findResponseCode = err.status
                this.findResponse = err.message
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
    <header :class="sectionColor+' w3-container'"> <H2>Expansion Find</H2></header>
    <div class="form-row findExpansion">
        <div class="col-6">
            <form @submit="submitExpansionFind">
                <div class="form-row">
                    <div class="col">
                        <label for="expansionFindLang">Select Language</label>
                        <select class="form-control" id="expansionFindLang" v-model="form.fromLang">
                            <option value="en">en</option>
                            <option value="de">de</option>
                            <option value="cs">cs</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="expansionFindText">Insert text</label>
                    <textarea id="expansionFindText" class="form-control" v-model="form.text" />
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
                    <h6 class="card-subtitle mb-2 text-muted">{{ findResponseCode}}</h6>

                    <h5 class="card-title">Return value</h5>
                    <h6 class="card-subtitle mb-2 text-muted">{{ findResponse }}</h6>

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
.findExpansion .card
{
    position: absolute;
    left: 10%;
    min-width: 20rem;
    min-height: 10rem;
    background: v-bind(findResponseColor);
}
.form-group
{
    padding-top: 20px;
}

</style>

