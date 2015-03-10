shared_examples "authenticated user" do
  it "redirects to the root path" do
    action
    expect(response).to redirect_to root_path
  end
end
