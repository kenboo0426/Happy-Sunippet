<template>
    <Header></Header>
    <main>
    <section>
        <div class="mb-3">
            <label for="username" class="form-labe fw-bold">ユーザーネーム</label>
            <input class="form-control" type="text" id="username" v-model="username">
        </div>
        <div class="mb-3">
            <label for="email" class="form-label fw-bold">メールアドレス</label>
            <input class="form-control" type="email" id="email" v-model="email">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label fw-bold">パスワード</label>
            <input class="form-control" type="password" id="password" v-model="password">
        </div>
        <div>
            <button @click="signUp" type="button" class="btn btn-outline-success fw-bold">サインアップ</button>
        </div>
        <div v-if="message">
            <h3>{{message}}</h3>
        </div>
    </section>
    </main>
    <Footer></Footer>
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../components/Footer.vue'
import api from '../services/api'

export default {
    name: 'SignupPage',
    components: {
        Header,
        Footer,
    },
    data() {
        return {
            username: "",
            email: "",
            password: "",
            message: "",
        }
    },
    methods: {
        signUp() {
            api.post('users/',{
                "name":this.username,
                "email":this.email,
                "password":this.password
            }).then((response)=> {
                console.log("signup!",JSON.stringify(response.data))
                this.$router.push('/login')
            }).catch((error)=> {
                this.message = error
                console.log(error)
            })
        }
    }
}
</script>