App.Router.reopen
  location: 'history'

App.Router.map ->
  @resource 'nights', { path: '/' }
  @resource 'songs', { path: '/admin/songs' }, ->
    @route 'new'
    @resource 'song', { path: ':id' }

  @route 'login'
  @route 'admin'