<template>
  <div class="card">
    <div class="card-body">
      <div id="videos">
        <div id="publisher"></div>
        <div id="subscriber"></div>
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
      sessionId: '2_MX40NjUzMTcwMn5-MTU4NDk1MDIxOTEzNH5jYnJiNEI1Z2tHTVMzTnU2cFZMdHpleVB-fg',
      token: 'T1==cGFydG5lcl9pZD00NjUzMTcwMiZzaWc9ZGU1ZTA1MzBiNTZhZGM1ZjEwMzU2ODMxYjRmY2U3ZTlmM2JiNGVmMjpzZXNzaW9uX2lkPTJfTVg0ME5qVXpNVGN3TW41LU1UVTRORGsxTURJeE9URXpOSDVqWW5KaU5FSTFaMnRIVFZNelRuVTJjRlpNZEhwbGVWQi1mZyZjcmVhdGVfdGltZT0xNTg0OTUwMzE3Jm5vbmNlPTAuMjYyMzAwNDgyNTUwNjk5MTUmcm9sZT1wdWJsaXNoZXImZXhwaXJlX3RpbWU9MTU4NzU0MjMxNyZpbml0aWFsX2xheW91dF9jbGFzc19saXN0PQ=='
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
