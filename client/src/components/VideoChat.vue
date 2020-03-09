<template>
  <div class="card">
    <div class="card-body">
      <div id="videos">
        <div id="publisher"></div>
      </div>
      <h5 class="card-title">Video Chat</h5>
      <p class="card-text">Welcome to the Video Chat page!</p>
      <p class="card-text"><small class="text-muted">Currently there are 0 users connected</small></p>
    </div>
  </div>
</template>

<script>
import { MY_NEWSLETTERS_QUERY } from '../constants/graphql'
import OT from '@opentok/client'

export default {
  apollo: {
    myNewsletters: {
      query: MY_NEWSLETTERS_QUERY
    }
  },
  data () {
    return {
      selected: '',
      apiKey: '46531702',
      sessionId: '2_MX40NjUzMTcwMn5-MTU4MzcyMTIzNjE3NX5VOUk1TXlQK1FSc21vRFUzUGdGUTlYVjJ-fg',
      token: 'T1==cGFydG5lcl9pZD00NjUzMTcwMiZzaWc9NDI3MjliZDA4NTYwYTU1YTY2MDU3YjNiZTk1MjM4NWU0ZTAxMzUzODpzZXNzaW9uX2lkPTJfTVg0ME5qVXpNVGN3TW41LU1UVTRNemN5TVRJek5qRTNOWDVWT1VrMVRYbFFLMUZTYzIxdlJGVXpVR2RHVVRsWVZqSi1mZyZjcmVhdGVfdGltZT0xNTgzNzIxMjg3Jm5vbmNlPTAuNzk5MTc0NzI0MjAxMDgyNSZyb2xlPXB1Ymxpc2hlciZleHBpcmVfdGltZT0xNTgzNzI0ODg2JmluaXRpYWxfbGF5b3V0X2NsYXNzX2xpc3Q9'
    }
  },
  mounted () {
    this.initializeSession()
  },
  methods: {
    selectFilter (newsletterId) {
      this.selected = newsletterId
      this.$root.$emit('filter', newsletterId)
    },
    clearFilter () {
      this.selected = ''
      this.$root.$emit('filter', null)
    },
    initializeSession () {
      const session = OT.initSession(this.apiKey, this.sessionId)

      // Subscribe to a newly created stream
      session.on('streamCreated', function (event) {
        session.subscribe(event.stream, 'subscriber', {
          insertMode: 'append',
          width: '100%',
          height: '100%'
        }, this.handleError)
      })

      // Create a publisher
      const publisher = OT.initPublisher('publisher', {
        insertMode: 'append',
        width: '100%',
        height: '100%'
      }, this.handleError)

      // Connect to the session
      session.connect(this.token, function (error) {
        // If the connection is successful, publish to the session
        if (error) {
          this.handleError(error)
        } else {
          session.publish(publisher, this.handleError)
        }
      })
    },
    handleError (error) {
      if (error) {
        alert(error.message)
      }
    }
  }
}
</script>
<style lang="scss" scoped>
#publisher {
  height: 500px;
  width: 800px;
  border: 3px solid white;
  border-radius: 3px;
}
</style>
