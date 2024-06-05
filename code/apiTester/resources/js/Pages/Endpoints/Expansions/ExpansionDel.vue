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
                original: '',
                replacement: '',
                action: 'del',
                apiKey: 'zzspk_Michal_mikCkwqSdSs4X9TpnYqeowmSFwPPdCS'
            },
            delResponse: 'none',
            delResponseCode: 'null',
            delResponseColor: ' #f2f2f2',
        }
    },
    props: {
        sectionColor: String,
    },
    methods: {
        async submitExpansionDel(e) {
            axios.post('http://localhost:3149/expansion/', this.form, {
                headers: {
                    // remove headers
                }
            }).then(res => {
                console.log(res);
                this.delResponseColor = '#c1f0c1'
                this.delResponseCode = res.status
                this.delResponse = res.message
            }).catch(err => {
                this.delResponseColor = '#ffad99'
                this.delResponseCode = err.status
                this.delResponse = err.message
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
    <header :class="'w3-container '+ sectionColor"> <H2>Expansion Delete</H2></header>
    <div class="form-row delExpansion">
        <div class="col-6">
            <form @submit="submitExpansionDel">
                <div class="form-row">
                     <div class="col">
                        <label for="expansionDelLang">Select language</label>
                        <select class="form-control" id="expansionDelToLang" v-model="form.lang">
                            <option value="en" >en</option>
                            <option value="de">de</option>
                            <option value="cs">cs</option>
                        </select>
                    </div>
                     <div class="col">
                         <div class="form-group">
                             <label for="expansionDelOriginal">Insert original text</label>
                             <textarea id="expansionDelOriginal" class="form-control" v-model="form.original" />
                         </div>
                     </div>
                </div>
                <div class="form-group">
                    <label for="expansionDelReplacement">Insert replacement</label>
                    <textarea id="expansionDelReplacement" class="form-control" v-model="form.replacement" />
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
                    <h6 class="card-subtitle mb-2 text-muted">{{ delResponseCode}}</h6>

                    <h5 class="card-title">Return value</h5>
                    <h6 class="card-subtitle mb-2 text-muted">{{ delResponse }}</h6>

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
.delExpansion .card
{
    position: absolute;
    left: 10%;
    min-width: 20rem;
    height-min: 10rem;
    background: v-bind(delResponseColor);
}

</style>

