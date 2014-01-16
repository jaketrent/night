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

  @resource 'activities', { path: '/admin/activities' }, ->
    @route 'new'
    @resource 'activity', { path: ':id' }

  @route 'login'
  @route 'admin'