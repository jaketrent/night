App.Router.reopen
  location: 'history'

App.Router.map ->
  @resource 'nights', { path: '/' }
  @resource 'songs', { path: '/admin/songs' }, ->
    @route 'new'
    @resource 'song', { path: ':id' }

  @resource 'scriptures', { path: '/admin/scriptures' }, ->
    @route 'new'
    @resource 'scripture', { path: ':id' }

  @route 'login'
  @route 'admin'